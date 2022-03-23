#include "funciones.h"

int main()
{
    system("COLOR 9");

    int cantidadJugadores = 0;

    do
    {
        // Solicitar la cantidad de jugadores y validar que sean de 2 a 4
        system("cls");
        cout << "Ingrese la cantidad de jugadores (2 a 4): ";
        cin >> cantidadJugadores;
    } while (cantidadJugadores < 2 || cantidadJugadores > 4);
    
    vector<string>jugadores(cantidadJugadores, "");

    system("cls");
    fflush(stdin);

    cout << "Ingrese el nombre de cada persona (Enter para asignar un nombre generico): " << endl;

    // Ciclo que pida el nombre a cada jugador
    for (int i = 0; i < cantidadJugadores; i++)
    {
        cout << "nombre del Jugador(a) " << i+1 << ": ";
        getline(cin, jugadores[i]);

        if (jugadores[i] == "")
        {
            jugadores[i] = "Jugador " + to_string(i+1);
        }
    }
    fflush(stdin);

    char PlayAgain = 'S';
    int ronda = 1;

    do
    {
        system("cls");
        JugarPoker(jugadores, cantidadJugadores, ronda);
        fflush(stdin);
        ronda++;
        cout << endl << endl << "Si desea jugar otra vez ingrese \"S|N\": " << endl; 
        cout << "Si quiere ver el historial de ganes, ingrese \"H\": ";
        cin >> PlayAgain;
        PlayAgain = toupper(PlayAgain);

        if (PlayAgain == 'H')
        {
            system("cls");
            MostrarHistorial();

            cout << endl << endl << "Si desea jugar otra vez ingrese \"S|N\": " << endl;
            cin >> PlayAgain;
            PlayAgain = toupper(PlayAgain);
        }

    } while (PlayAgain == 'S');
        


    return 0;
}