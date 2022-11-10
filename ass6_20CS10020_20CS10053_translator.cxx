#include "ass6_20CS10020_20CS10053_translator.h"

// Global variables
quad_array *quad_arr; // array of quads
sym_table *curr_table; // current symbol table
sym_table *global_table; // global symbol table
sym_table *parent_table; // parent symbol table
sym *curr_symbol;  // A pointer pointing to the current symbol
sym_type::_type curr_type;  // current type
int table_cnt, temp_cnt; // counters for symbol table and temporary symbols
vector<string> str_list;

// Implementation of sym_type class
sym_type::sym_type(_type type,  int symWidth, sym_type *arrType) : type(type), symWidth(symWidth), arrType(arrType) {}

// Definition of getWidth for symbol types
int sym_type::getWidth()
{
    //cout << "symtype::getWidth" << endl;
    if (this->type == CHAR)
        return sizeof(char);
    else if (this->type == INT )
        return __SIZEOF_INT__;
    else if(this->type == PTR)
        return __SIZEOF_POINTER__;
    else if (this->type == FLOAT)
        return __SIZEOF_FLOAT__;
    else if (this->type == ARR)
        return symWidth * (arrType->getWidth());
    return 0;
}
// Implementation of activation_record class
activation_record::activation_record() : shift(map<string, int>()), final_shift(0) {}

// Implementation of sym_table class
sym_table::sym_table(string name, sym_table *parent) : name(name), parent(parent) {}

// Definition of lookup for symbol table
sym* sym_table::lookup(string name)
{   
    //cout << "sym_table::lookup " << name << " " << this << " " << this->name << " " << this->parent << endl;
    
    auto symIterator = this->symbolMap.find(name);
    if(symIterator != this->symbolMap.end()) return &(symIterator->second);

    sym* ptr = nullptr;
    if(this->parent != NULL) ptr = this->parent->lookup(name);

    if(this == curr_table && !ptr) {
        ptr = new sym(name);
        ptr->grp = sym::LOC;
        if(curr_table == global_table)
            ptr->grp = sym::GLB;
        this->symbolMap.insert({name, *(new sym(name))});
        return &((this)->symbolMap.find(name)->second);
    }

    return ptr;
}

// Definition of print function for symbol table
void sym_table::print()
{
    //cout << "sym_table::print" << endl;
    cout << string(140, '+') << endl;
    cout << setw(20) << "Table Name: " << this->name << setw(40) <<"\t\t Parent Name: "<< ((this->parent)?this->parent->name:"None") << endl;
    cout << string(140, '+') << endl;
    cout << setw(20) << "Name" << setw(40) << "Type" << setw(20) << "Initial Value" << setw(20) << "Offset" << setw(20) << "Size" << setw(20) << "Child" << "\n" << endl;
    vector<sym_table *> visit_queue;

    // print symbols in the table
    for (auto &symIterator : (this)->symbolMap)
    {
        cout << setw(20) << symIterator.first;
        fflush(stdout);
        cout << setw(40) << symIterator.second.type->printType();
        cout << setw(20) << symIterator.second.initValue << setw(20) << symIterator.second.offset << setw(20) << symIterator.second.size;
        cout << setw(20) << (symIterator.second.childTable ? symIterator.second.childTable->name : "NULL") << endl;

        if (symIterator.second.childTable)
        {
            visit_queue.push_back(symIterator.second.childTable);
        }
    }
    cout << string(140, '-') << endl;
    cout << "\n" << endl;
    // printing child tables
    for (auto &table : visit_queue)
    {
        table->print();
    }
}
string sym_type::printType()
{
    if(this->type == sym_type::_type::VOID) return "void";
    else if(this->type == sym_type::_type::INT) return "int";
    else if(this->type == sym_type::_type::FLOAT) return "float";
    else if(this->type == sym_type::_type::CHAR) return "char";
    else if(this->type == sym_type::_type::FUNC) return "function";
    else if(this->type ==  sym_type::_type::BLOCK) return "block";
    else if(this->type == sym_type::_type::PTR) return "ptr(" + this->arrType->printType() + ")";
    else if(this->type == sym_type::_type::ARR) return "array(" + to_string(this->symWidth) + ", " + this->arrType->printType() + ")";
    else return "";
}

// Definition of update for symbol table
void sym_table::update()
{
    //cout << "sym_table::update" << endl;
    //cout << this->name << endl;
    vector<sym_table*> visited;
    int offset;
    bool flag = true;
    for(auto &symIterator : this->symbolMap)
    {
        if(flag)
        {
            symIterator.second.offset = 0;
            offset = symIterator.second.size;
            flag = false;
        }
        else   
        {
            symIterator.second.offset = offset;
            offset += symIterator.second.size;
        }
        if(symIterator.second.childTable)
        {
            visited.push_back(symIterator.second.childTable);
        }
    }
    // activation record for the curr_table
    act_rec = new activationrecord();

    
    
    for (auto &table : visited)  // update children table
    {
        table->update();
    }

}

// Implementation of symbol class
sym::sym(string name, sym_type::_type type, string initValue) : name(name), type(new sym_type(type)), initValue(initValue), offset(0), childTable(NULL) {
    size = this->type->getWidth();
}

// Definition of update symbol for symbol class
sym* sym::updateSym(sym_type* type) {
    //cout << "sym::updateSym" << endl;
    this->type = type;
    this->size = this->type->getWidth();
    return this;
}

// Definition of typeCast for symbol class
sym* sym::typeCast(sym_type::_type type) {
    //cout << "sym::typeCast" << endl;
    if((this->type)->type == sym_type::_type::INT) {
        if(type == sym_type::_type::FLOAT) {
            sym* floatSym = generate_temp(type);
            emit("=", floatSym->name, "int_to_float(" + this->name + ")");
            return floatSym;
        }
        else if(type == sym_type::_type::CHAR) {
            sym* charSym = generate_temp(type);
            emit("=", charSym->name, "int_to_char(" + this->name + ")");
            return charSym;
        }
        else return this;
    }
    else if((this->type)->type == sym_type::_type::FLOAT) {
        if(type == sym_type::_type::INT) {
            sym* intSym = generate_temp(type);
            emit("=", intSym->name, "float_to_int(" + this->name + ")");
            return intSym;
        }
        else if(type == sym_type::_type::CHAR) {
            sym* charSym = generate_temp(type);
            emit("=", charSym->name, "float_to_char(" + this->name + ")");
            return charSym;
        }
        else return this;
    }
    else if((this->type)->type == sym_type::_type::CHAR) {
        if(type == sym_type::_type::INT) {
            sym* intSym = generate_temp(type);
            emit("=", intSym->name, "char_to_int(" + this->name + ")");
            return intSym;
        }
        else if(type == sym_type::_type::FLOAT) {
            sym* floatSym = generate_temp(type);
            emit("=", floatSym->name, "char_to_float(" + this->name + ")");
            return floatSym;
        }
        else return this;
    }
    else return this;
}

// Definition of linked children symbol tables for symbol class
sym* sym::linkChildSymTable(sym_table* table) {
    //cout << "sym::linkChildSymTable" << endl;
    this->childTable = table;
    return this;
}

quad::quad(string opcode, string result, string arg1, string arg2) : opcode(opcode), result(result), arg1(arg1), arg2(arg2) {}
quad::quad(string opcode, string result, int arg1, string arg2) : opcode(opcode), result(result), arg2(arg2) {
    this->arg1 = to_string(arg1);
}
quad::quad(string opcode, string result, float arg1, string arg2) : opcode(opcode), result(result), arg2(arg2) {
    this->arg1 = to_string(arg1);
}

void quad::print() {
    //cout << "quad::print()" << endl;
    if(this->opcode == "=") cout << this->result << " = " << this->arg1 << endl;
    else if(this->opcode == "call") cout << this->result << " = call " << this->arg1 << ", " << this->arg2 << endl;
    else if(this->opcode == "return") cout << "return " << this->result << endl;
    else if(this->opcode == "param") cout << "param " << this->result << endl;
    else if(this->opcode == "goto") cout << "goto " << this->result << endl;
    else if(this->opcode == "label") cout << this->result << endl;
    else if(this->opcode == "=[]") cout << this->result << " = " << this->arg1 << "[" << this->arg2 << "]" << endl;
    else if(this->opcode == "[]=") cout << this->result << " = " << "[" << this->arg1 << "]" << this->arg2 << endl;
    else if(this->opcode == "+" || this->opcode == "-" || this->opcode == "*" || this->opcode == "/" || this->opcode == "%" || this->opcode == "|" || this->opcode == "^" || this->opcode == "&" || this->opcode == "<<" || this->opcode == ">>")
        cout << this->result << " = " << this->arg1 << " " << this->opcode << " " << this->arg2 << endl;
    else if(this->opcode == "==" || this->opcode == "!=" || this->opcode == "<" || this->opcode == ">" || this->opcode == "<=" || this->opcode == ">=")
        cout << "if " << this->arg1 << " " << this->opcode << " " << this->arg2 << " goto " << this->result << endl;
    else if(this->opcode == "*=")
        cout << "*" << this->result << " = " << this->arg1 << endl;
    else if(this->opcode == "=&")
        cout << this->result << " = & " << this->arg1 << endl;
    else if(this->opcode == "=*")
        cout << this->result << " = * " << this->arg1 << endl;
    else if(this->opcode == "=-")
        cout << this->result << " = - " << this->arg1 << endl;
    else if(this->opcode == "~")
        cout << this->result << " = ~ " << this->arg1 << endl;
    else if(this->opcode == "!")
        cout << this->result << " = ! " << this->arg1 << endl;
    else {
        cout << "opcode: " << this->opcode << "  arg1: " << this->arg1 << "  arg2: " << this->arg2 << "  result: " << this->result << endl;
        cout << "Error: Invalid Opcode" << endl;
    }
}

void quad_array::print() {
    //cout << "quad_array::print()" << endl;
    int lineNo = 1;
    for(auto quad: this->array) {
        cout << lineNo++ << ": ";
        quad.print();
    }
}

void emit(string opcode, string result, string arg1, string arg2) {
    //cout << "emit1: " << opcode << " " << result << " " << arg1 << " " << arg2 << endl;
    quad* newQuad = new quad(opcode, result, arg1, arg2);
    quad_arr->array.push_back(*newQuad);
}

void emit(string opcode, string result, int arg1, string arg2) {
    //cout << "emit2: " << opcode << " " << result << " " << arg1 << " " << arg2 << endl;
    quad* newQuad = new quad(opcode, result, arg1, arg2);
    quad_arr->array.push_back(*newQuad);
}

void emit(string opcode, string result, float arg1, string arg2) {
    //cout << "emit3: " << opcode << " " << result << " " << arg1 << " " << arg2 << endl;
    quad* newQuad = new quad(opcode, result, arg1, arg2);
    quad_arr->array.push_back(*newQuad);
}

void back_patch(list<int> existingList, int address) {
    //cout<<"back_patch"<<endl;
    for(auto i = existingList.begin(); i != existingList.end(); i++) {
        quad_arr->array[(*i)-1].result = to_string(address);
    }
}

list<int> make_list(int i) {
    //cout<<"make_list"<<endl;
    return {i};
}

list<int> merge(list<int>l1, list<int>l2) {
    //cout<<"merge"<<endl;
    list<int> temp = l1;
    temp.merge(l2);
    return temp;
}

void Exp::convertToBool() {
    //cout<<"convertToBool"<<endl;
    if(this->type == Exp::_type::NON_BOOLEAN) {
        this->false_list = make_list(next_instrn());
        emit("==", "", this->symbol->name, "0");
        this->true_list = make_list(next_instrn());
        emit("goto", "");
    }
}

void Exp::convertToInt() {
    //cout<<"convertToInt"<<endl;
    if(this->type == Exp::_type::BOOLEAN) {
        this->symbol = generate_temp(sym_type::_type::INT);
        back_patch(this->true_list, next_instrn());
        emit("=", this->symbol->name, "true");
        emit("goto", to_string(quad_arr->array.size()+2));
        back_patch(this->false_list, next_instrn());
        emit("=", this->symbol->name, "false");
    }
}

string convertToString(char c) { return string(1, c); }

string convertToString(int i) { return to_string(i); }

string convertToString(float f) { return to_string(f); }

int next_instrn() { return (quad_arr->array.size())+1; }

sym *generate_temp(sym_type::_type type, string initValue) {
    //cout<<"generate_temp"<<endl;
    sym* temp = new sym("t" + to_string(temp_cnt++), type, initValue);
    curr_table->symbolMap.insert({temp->name, *temp});
    return temp;
}

void switch_table(sym_table* new_table) { curr_table = new_table; }

bool check_sym_type_type(sym_type* a, sym_type* b) {
    //cout<<"check_sym_type_type"<<endl;
    if(a == NULL && b == NULL) return true;
    if(a == NULL || b == NULL) return false;
    if(a->type != b->type) return false;
    return check_sym_type_type(a->arrType, b->arrType);
}

bool check_sym_type(sym *&s1, sym *&s2)
{   
    //cout<<"check_sym_type"<<endl;
    sym_type* a = s1->type;
    sym_type* b = s2->type;
    if(check_sym_type_type(a, b)) return true;
    else if(a == s1->typeCast(a->type)->type) return true;
    else if (b == s2->typeCast(b->type)->type) return true;
    return false;
}


int main() {
    table_cnt = 0, temp_cnt = 0;
    global_table = new sym_table("glb");
    curr_table = global_table;
    quad_arr = new quad_array();
    yyparse();
    global_table->update();
    global_table->print();
    quad_arr->print();
    return 0;
}