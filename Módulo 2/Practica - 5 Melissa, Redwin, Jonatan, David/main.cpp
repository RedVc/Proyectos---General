#include "funciones.h"

int main (){
    char continuar;
    do
    {
        system("cls");
        Juego();

        cout << "Si desea volver a jugar ingrese S/N:\t";
        cin >> continuar;
        continuar = toupper(continuar);
    } while (continuar == 'S');

    return 0;
}