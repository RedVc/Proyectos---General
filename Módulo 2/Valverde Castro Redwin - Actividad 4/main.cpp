/* Redwin valverde Castro
   21/04/2021
*/
#include <iostream>
#include "funciones.h"
using namespace std;

int main(){
    char continuar = ' ';
    int elegir = 0;

    do
    {
        system("color 2");
        system("cls");
        cout << "Ingrese un numero del 1 al 10" << endl;
        cout << "Del 1 al 9 seran los ejercicios, 10 para finalizar ejecucion: ";
        cin >> elegir;
    } while (elegir < 1 || elegir > 10);
    
    switch (elegir)
    {
    case 1:
        ejercicio1();
        main();
        break;
    case 2:
        ejercicio2();
        main();
        break;
    case 3:
        ejercicio3();
        main();
        break;
    case 4:
        ejercicio4();
        main();
        break;
    case 5:
        ejercicio5();
        main();
        break;
    case 6:
        ejercicio6();
        main();
        break;
    case 7:
        ejercicio7();
        main();
        break;
    case 8:
        ejercicio8();
        main();
        break;
    case 9:
        ejercicio9();
        main();
        break;
    case 10:
        return 0;
        break;
    }
    
}