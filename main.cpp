#include <iostream>
#include <vector>
#include <fstream>
#include <time.h>
#include <iomanip>
#include <sstream>

using namespace std;

vector<string> femaleNames;
vector<string> maleNames;
vector<string> lastNames;

////////////GET NAMES///////////////

void getFemaleNames()
{
    ifstream file("female.txt");
    if(!file.is_open())
    {
        perror("\nfemale.txt failed to open!\n");
        exit(1);
    }

    string line = "";
    while(getline(file, line)){
        femaleNames.push_back(line);
    }
}

void getMaleNames()
{
    ifstream file("male.txt");
    if(!file.is_open())
    {
        perror("\nmale.txt failed to open!\n");
        exit(1);
    }

    string line = "";
    while(getline(file, line)){
        maleNames.push_back(line);
    }
}

void getLastNames()
{
    ifstream file("lastNames.txt");
    if(!file.is_open())
    {
        perror("\nlastNames.txt failed to open!\n");
        exit(1);
    }

    string line = "";
    while(getline(file, line)){
        lastNames.push_back(line);
    }
}

enum Gender{
    male,
    female
};

string getRandomName(Gender gender)
{
    unsigned long int i = 0;
    string name;
    switch (gender)
    {
        case male:
            i = rand() % (maleNames.size() -1);
            name = maleNames.at(i);
            break;
        case female:
            i = rand() % (femaleNames.size() -1);
            name = femaleNames.at(i);
            break;
    }

    i = rand() % (lastNames.size() -1);
    string lastName = lastNames.at(i);

    return name + " " + lastName;
}

///////////////////////////////////

string getRandomDate(int lowerYear, int upperYear)
{
    int day = rand() % 27 + 1; //só pra n complicar as datas
    int month = rand() % 11 + 1;
    int year = rand() % (upperYear - lowerYear) + lowerYear;

    std::stringstream ss;
    ss << std::setw(2) << std::setfill('0') << day;
    std::string dayString = ss.str();

    std::stringstream ss1;
    ss1 << std::setw(2) << std::setfill('0') << month;
    std::string monthString = ss1.str();

    string date = to_string(year) + "-" + monthString + "-" + dayString;
    return date;
}

string generateID(int id)
{
    std::stringstream ss;
    ss << std::setw(6) << std::setfill('0') << id;
    std::string s = ss.str();
    return s;
}

string generateSQLClient(string ID, string date)
{
    string insert = "INSERT INTO Clientes VALUES ";
    insert += "(" + ID + ", ";
    string year = date.substr(0,4);
    int age = 2019 - stoi(year);

    double height;
    if(age < 14)
    {
        height = rand()/(RAND_MAX/0.3) + 1.3;
    }
    else
    {
        height = rand()/(RAND_MAX/0.45) + 1.5;
    }

    std::stringstream ss;
    ss << std::setprecision(3) << std::setfill('0') << height;
    std::string heightS = ss.str();

    insert += heightS + ", ";
    insert += "NULL);\n";

    return insert;
}

string ticketTypes[] = {
        "'Regular'",
        "'Gold'",
        "'Premium'",
};

string generateSQLticket(string ID, string Nbilhete, string DataNasc, string* date1, string* date2)
{
    string insert = "INSERT INTO Bilhetes VALUES ";
    insert += "(" + ID + ", " + Nbilhete + ", ";

    int type = rand() % 3;
    insert += ticketTypes[type] + ", ";

    int dias = rand() % 5 + 1;
    string Syear = DataNasc.substr(0,4);
    int year = stoi(Syear);
    int lowerYear = max(year + 5, 2010);
    string endDate = getRandomDate(lowerYear, 2018);

    int day = stoi(endDate.substr(8,2));

    int diff = day - dias;
    if(diff < 1)
    {
        day += dias;
        std::stringstream ss;
        ss << setw(2) << std::setfill('0') << day;
        std::string dayS = ss.str();
        endDate = endDate.substr(0,8) + dayS;
    }

    int beginDay = day - dias;
    std::stringstream ss;
    ss << setw(2) << std::setfill('0') << beginDay;
    std::string dayS = ss.str();
    string beginDate = endDate.substr(0,8) + dayS;

    insert += beginDate + ", " + endDate + ");\n";

    *date1 = beginDate;
    *date2 = endDate;

    return insert;
}

string especialidades[5] = {
        "Segurança",
        "Técnico",
        "Cozinheiro",
        "Staff",
        "Gerente",
};

string generateSQLFun(string ID)
{
    string insert = "INSERT INTO Funcionarios VALUES ";
    insert += "(" + ID + ", ";
    string especialidade = especialidades[rand() % 5];
    insert += "'" + especialidade + "', ";

    long int nif = rand() % 999999999 + 1000000000;
    std::stringstream ss;
    ss << std::setprecision(3) << std::setfill('0') << nif;
    std::string s = ss.str();

    insert += s + ");\n";

    return insert;
}

string generateSQLVisistas(string clientID, string data1, string data2)
{
    string insert = "";
    int num = rand() % 8 + 1;
    vector<int> Ids;

    for(unsigned int i = 0; i < num; i++)
    {
        insert += "INSERT INTO Visitas VALUES ";
        insert += "(" + clientID + ", ";

        int serivceID;
        do{
            serivceID = rand() % 15 + 1;
        } while(find(Ids.begin(), Ids.end(), serivceID) != Ids.end());
        Ids.push_back(serivceID);

        std::stringstream ss;
        ss << std::setw(2) << std::setfill('0') << serivceID;
        std::string s = ss.str();
        insert += s + ", ";

        int day1 = stoi(data1.substr(8,2));
        int day2 = stoi(data2.substr(8,2));

        int dias = rand() % (day2 - day1 + 1);
        int day = day1 + dias;
        std::stringstream ss1;
        ss1 << std::setw(2) << std::setfill('0') << day;
        std::string Sday = ss1.str();
        string data = data1.substr(0,8) + Sday;
        insert += data + ", ";

        int rating = rand() % 8;
        string rat = "";
        if(rating > 5) rat = "NULL";
        else rat = to_string(rating);
        insert += rat + ");\n";
    }

    return insert;
}

string generateSQLmeses()
{
    string meses[12] = {
            "'Janeiro'",
            "'Fevereiro'",
            "'Março'",
            "'Abril'",
            "'Maio'",
            "'Junho'",
            "'Julho'",
            "'Agosto'",
            "'Setembro'",
            "'Outubro'",
            "'Novembro'",
            "'Dezembro'"
    };

    string insert = "";
    int id = 1;
    for(int year = 2010; year < 2019; year++)
    {
        for(int i = 0; i < 12; i++)
        {
            insert += "INSERT INTO Mes VALUES ";

            std::stringstream ss;
            ss << std::setw(3) << std::setfill('0') << id;
            std::string idString = ss.str();
            insert += "(" + idString + ", ";
            id++;

            insert +=  meses[i] + ", " + to_string(year) + ");\n";
        }
    }

    return insert;
}

string generateSQLpagamento(string idFunc)
{
    string insert = "";

    int year = rand() % 7 + 2010;
    int max = 2018 - year;
    int Nmonths = rand() % 5 + max;

    for(unsigned int i = 1; i <= Nmonths; i++)
    {
        insert += "INSERT INTO RegistoPagamentos VALUES ";

        int monthID = (year - 2010)*12 + i;
        std::stringstream ss;
        ss << std::setw(3) << std::setfill('0') << monthID;
        std::string idString = ss.str();
        insert += "(" + idString + ", ";

        insert += idFunc + ", ";

        int horasX = rand() % 20;
        insert += to_string(horasX) + ", ";

        int bonus = rand() % 2000 + 1;
        if(bonus < 500) bonus = 0;
        insert += to_string(bonus) + ", ";

        insert += "NULL);\n";
    }

    return insert;
}

string generateSQLworkH(string funcID)
{
    string insert;
    vector<int> ids;

    for(unsigned int i = 0; i < 7; i++)
    {
        insert += "INSERT INTO HorariosTrabalho VALUES ";

        int idHorario;
        do{
            idHorario = rand() % 14 +1;
        }while(find(ids.begin(), ids.end(), idHorario) != ids.end());
        ids.push_back(idHorario);
        insert += "(" + to_string(idHorario) + ", " + funcID + ");\n";
    }

    return insert;
}

int serviceFids[15] = {0};
string generateSQLserviceFunc(string funcID)
{
    int n = rand() % 3 + 1;
    string insert;
    vector<int> ids;

    for(unsigned int i = 0; i < n; i++)
    {
        insert += "INSERT INTO FuncionarioDeServiço VALUES ";

        int serviceID;
        do{
            serviceID = rand() % 15 + 1;
        } while(find(ids.begin(), ids.end(), serviceID) != ids.end());
        ids.push_back(serviceID);
        std::stringstream ss;
        ss << std::setw(2) << std::setfill('0') << serviceID;
        std::string idString = ss.str();
        insert += "(" + idString + ", " + funcID + ", ";

        serviceFids[serviceID]++;
        insert += to_string(serviceFids[serviceID]) + ");\n";
    }

    return insert;
}

string generateHierarchy(vector<string> ids, vector<string> chefes)
{
    if(ids.empty()) return "";
    if(chefes.empty())
    {
        for(unsigned int i = 0; i < 5; i++)
        {
            int n = rand() % ids.size();
            string id = ids.at(n);
            ids.erase(ids.begin() + n);
            chefes.push_back(id);
        }

        return generateHierarchy(ids,chefes);
    }


    string insert = "";
    vector<string> newChefes;
    for(unsigned int i = 0; i < chefes.size(); i++)
    {
        for(unsigned int j = 0; j < 5; j++)
        {
            if(ids.empty()) break;
            int n = rand() % ids.size();
            string id = ids.at(n);
            ids.erase(ids.begin() + n);
            newChefes.push_back(id);

            insert += "INSERT INTO Hierarquias VALUES ";
            insert += "(" + id + ", " + chefes.at(i) + ");\n";
        }
    }
    insert += generateHierarchy(ids, newChefes);

    return insert;
}

void generateSQLPeopleInsert(int number)
{
    ofstream output("povoar.sql");

    vector<string> PeopleInsert;
    vector<string> clientInsert;
    vector<string> funcInsert;
    vector<string> ticketInsert;
    vector<string> visitasInsert;
    string mesesInsert;
    vector<string> pagamentosInsert;
    vector<string> horariosTrabInsert;
    vector<string> serviceFInsert;

    vector<string> funcIds;
    string hierarchy;

    unsigned int nBilhetes = 1;
    string insert = "INSERT INTO Pessoas VALUES ";

    mesesInsert = generateSQLmeses();

    for(unsigned int i = 1; i <= number; i++)
    {
        int g = rand() % 2 +1;
        Gender gender;
        if(g == 1) gender = male;
        else gender = female;
        string genderString;
        if(gender == female) genderString = "F";
        else genderString = "M";
        string id = generateID(i);
        string Bdate = getRandomDate(1970, 2010);

        PeopleInsert.push_back(insert + "(" + id + ", " + "'" + getRandomName(gender) + "', " + Bdate + ", '" + genderString +"');\n");

        int random = rand() % 10;
        if(random > 2)
        {
            string date1, date2 = "";
            clientInsert.push_back(generateSQLClient(id, Bdate));
            ticketInsert.push_back((generateSQLticket(id, to_string(nBilhetes), Bdate, &date1, &date2)));
            nBilhetes++;
            visitasInsert.push_back(generateSQLVisistas(id, date1, date2));
        }
        else {
            funcInsert.push_back(generateSQLFun(id));
            pagamentosInsert.push_back(generateSQLpagamento(id));
            horariosTrabInsert.push_back(generateSQLworkH(id));
            serviceFInsert.push_back(generateSQLserviceFunc(id));
            funcIds.push_back(id);
        }
    }

    vector<string> tmp;
    hierarchy = generateHierarchy(funcIds, tmp);

    for(unsigned int i = 0; i < number; i++)
    {
        output << PeopleInsert.at(i);
    }

    output << endl;

    for(unsigned int i = 0; i < clientInsert.size(); i++)
    {
        output << clientInsert.at(i);
    }

    output << endl;

    for(unsigned int i = 0; i < funcInsert.size(); i++)
    {
        output << funcInsert.at(i);
    }

    output << endl;

    for(unsigned int i = 0; i < ticketInsert.size(); i++)
    {
        output << ticketInsert.at(i);
    }

    output << endl;

    for(unsigned int i = 0; i < visitasInsert.size(); i++)
    {
        output << visitasInsert.at(i);
    }

    output << endl;

    output << mesesInsert << endl;

    for(unsigned int i = 0; i < pagamentosInsert.size(); i++)
    {
        output << pagamentosInsert.at(i);
    }

    output << endl;

    for(unsigned int i = 0; i < horariosTrabInsert.size(); i++)
    {
        output << horariosTrabInsert.at(i);
    }

    output << endl;

    for(unsigned int i = 0; i < serviceFInsert.size(); i++)
    {
        output << serviceFInsert.at(i);
    }

    output << endl << hierarchy;
}

int main() {
    srand (time(NULL));

    getFemaleNames();
    getMaleNames();
    getLastNames();

    generateSQLPeopleInsert(150);
    return 0;
}