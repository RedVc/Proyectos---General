#include <vector>
#include <array>
#include <iostream>
#include <string>
#include <algorithm>
#include <stdlib.h> // para aleatorios
#include <time.h>   // para aleatorios
#include <iomanip>
#include <fstream>

using namespace std;

void historialBase(){
    ofstream Historial;

    Historial.open("HistorialPoker.txt", ios::out);

    if (Historial.fail())
    {
        cout << endl << "Error creando la base del archivo" << endl;
        exit(1);
    }

    // Bloque de codigo para los datos del blog de notas (.txt)
    Historial << "_________________=============================_________________" << endl;
    Historial << "==================      HISTORIAL POKER      ==================" << endl;
    Historial << "__________________===========================__________________" << endl << endl;
    
    Historial << "Historial de las partidas recientes:" << endl << endl;

    Historial.close();
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// _____________________________________________________ HistorialAgregada _____________________________________________________
// Agrega al historial el ganador, recibe un parametro concatenado, no retorna

void HistorialAgregada(string mensajeGanador){
    ofstream Historial;

    Historial.open("HistorialPoker.txt", ios::app);

    if (Historial.fail())
    {
        cout << endl << "Error agregando el historial" << endl;
        exit(1);
    }

    Historial << endl << mensajeGanador << endl;

    Historial.close();
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// _____________________________________________________ MostrarArchivo _____________________________________________________

void MostrarHistorial(){
    ifstream Historial;
    string texto;

    system("cls");

    Historial.open("HistorialPoker.txt", ios::in);

    if (Historial.fail())
    {
        cout << endl << "Error abriendo el historial" << endl;
        exit(1);
    }

    while (!Historial.eof())
    {
        getline(Historial, texto);
        cout << texto << endl;
    }
    
    Historial.close();
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// _____________________________________________________ Ganador _____________________________________________________

void Ganador(vector<string> jugadores,
             int cantidadJugadores,
             int J1Jugada,
             int mayorJ1,
             int J2Jugada,
             int mayorJ2,
             int J3Jugada,
             int mayorJ3,
             int J4Jugada,
             int mayorJ4){

    // ------------------------------------- Dos Jugadores -------------------------------------
    if (cantidadJugadores == 2)
    {
        // Ganador
        if (J1Jugada < J2Jugada)
        {
            J1Jugada = 1;
        }
        else if (J2Jugada < J1Jugada)
        {
            J2Jugada = 1;
        }
        // Empate
        else if (J1Jugada == J2Jugada)
        {
            if (mayorJ1 > mayorJ2)
            {
                J1Jugada = 1;
            }
            else if (mayorJ2 > mayorJ1)
            {
                J2Jugada = 1;
            }
        }        
    }

    // ------------------------------------- Tres Jugadores -------------------------------------
    if (cantidadJugadores == 3)
    {
        // Gane J1
        if (J1Jugada < J2Jugada && J1Jugada < J3Jugada)
        {
            J1Jugada = 1;
        }
        // Gane J2
        else if (J2Jugada < J1Jugada && J2Jugada < J3Jugada)
        {
            J2Jugada = 1;
        }
        // Gane J3
        else if (J3Jugada < J1Jugada && J3Jugada < J2Jugada)
        {
            J3Jugada = 1;
        }
        
        // Triple primer lugar
        else if (J1Jugada == J2Jugada && J2Jugada == J3Jugada)
        {
            // Gane J1
            if (mayorJ1 > mayorJ2 && mayorJ1 > mayorJ3)
            {
                J1Jugada = 1;
            }
            // Gane J2
            else if (mayorJ2 > mayorJ1 && mayorJ2 > mayorJ3)
            {
                J2Jugada = 1;
            }
            // Gane J3
            else if (mayorJ3 > mayorJ1 && mayorJ3 > mayorJ2)
            {
                J3Jugada = 1;
            }
        }
        // Empate J1 J2
        else if (J1Jugada == J2Jugada)
        {
            if (mayorJ1 > mayorJ2)
            {
                J1Jugada = 1;
            }
            else if (mayorJ2 > mayorJ1)
            {
                J2Jugada = 1;
            }
        }
        // Empate J2 J3
        else if (J2Jugada == J3Jugada)
        {
            if (mayorJ2 > mayorJ3)
            {
                J2Jugada = 1;
            }
            else if (mayorJ3 > mayorJ2)
            {
                J3Jugada = 1;
            }
        }
        // Empate J1 J3
        else if (J1Jugada == J3Jugada)
        {
            if (mayorJ1 > mayorJ3)
            {
                J1Jugada = 1;
            }
            else if (mayorJ3 > mayorJ1)
            {
                J3Jugada = 1;
            }
        }
    }
    // ------------------------------------- Cuatro Jugadores -------------------------------------
    if (cantidadJugadores == 4)
    {
        // Gane J1
        if (J1Jugada < J2Jugada && J1Jugada < J3Jugada && J1Jugada < J4Jugada)
        {
            J1Jugada = 1;
        }
        // Gane J2
        else if (J2Jugada < J1Jugada && J2Jugada < J3Jugada && J2Jugada < J4Jugada)
        {
            J2Jugada = 1;
        }
        // Gane J3
        else if (J3Jugada < J1Jugada && J3Jugada < J2Jugada && J3Jugada < J4Jugada)
        {
            J3Jugada = 1;
        }
        // Gane J4
        else if (J4Jugada < J1Jugada && J4Jugada < J2Jugada && J4Jugada < J3Jugada)
        {
            J4Jugada = 1;
        }
        // ----------------------
        // Cuadruple primer lugar
        else if (J1Jugada == J2Jugada && J2Jugada == J3Jugada && J3Jugada == J4Jugada)
        {
            // Gane J1
            if (mayorJ1 > mayorJ2 && mayorJ1 > mayorJ3 && mayorJ1 > mayorJ4)
            {
                J1Jugada = 1;
            }
            // Gane J2
            else if (mayorJ2 > mayorJ1 && mayorJ2 > mayorJ3 && mayorJ2 > mayorJ4)
            {
                J2Jugada = 1;
            }
            // Gane J3
            else if (mayorJ3 > mayorJ1 && mayorJ3 > mayorJ2 && mayorJ3 > mayorJ4)
            {
                J3Jugada = 1;
            }
            // Gane J4
            else if (mayorJ4 > mayorJ1 && mayorJ4 > mayorJ2 && mayorJ4 > mayorJ3)
            {
                J4Jugada = 1;
            }
        }
        // ----------------------
        // Triple primer lugar 1 2 3
        else if (J1Jugada == J2Jugada && J2Jugada == J3Jugada)
        {
            // Gane J1
            if (mayorJ1 > mayorJ2 && mayorJ1 > mayorJ3)
            {
                J1Jugada = 1;
            }
            // Gane J2
            else if (mayorJ2 > mayorJ1 && mayorJ2 > mayorJ3)
            {
                J2Jugada = 1;
            }
            // Gane J3
            else if (mayorJ3 > mayorJ1 && mayorJ3 > mayorJ2)
            {
                J3Jugada = 1;
            }
        }
        // ----------------------
        // Triple primer lugar 1 2 4
        else if (J1Jugada == J2Jugada && J2Jugada == J4Jugada)
        {
            // Gane J1
            if (mayorJ1 > mayorJ2 && mayorJ1 > mayorJ4)
            {
                J1Jugada = 1;
            }
            // Gane J2
            else if (mayorJ2 > mayorJ1 && mayorJ2 > mayorJ4)
            {
                J2Jugada = 1;
            }
            // Gane J4
            else if (mayorJ4 > mayorJ1 && mayorJ4 > mayorJ2)
            {
                J4Jugada = 1;
            }
        }
        // ----------------------
        // Triple primer lugar 1 3 4
        else if (J1Jugada == J3Jugada && J3Jugada == J4Jugada)
        {
            // Gane J1
            if (mayorJ1 > mayorJ3 && mayorJ1 > mayorJ4)
            {
                J1Jugada = 1;
            }
            // Gane J3
            else if (mayorJ3 > mayorJ1 && mayorJ3 > mayorJ4)
            {
                J3Jugada = 1;
            }
            // Gane J4
            else if (mayorJ4 > mayorJ1 && mayorJ4 > mayorJ3)
            {
                J4Jugada = 1;
            }
        }
        // ----------------------
        // Triple primer lugar 2 3 4
        else if (J2Jugada == J3Jugada && J3Jugada == J4Jugada)
        {
            // Gane J2
            if (mayorJ2 > mayorJ3 && mayorJ2 > mayorJ4)
            {
                J2Jugada = 1;
            }
            // Gane J3
            else if (mayorJ3 > mayorJ2 && mayorJ3 > mayorJ4)
            {
                J3Jugada = 1;
            }
            // Gane J4
            else if (mayorJ4 > mayorJ2 && mayorJ4 > mayorJ3)
            {
                J4Jugada = 1;
            }
        }
        // ----------------------
        // Empate J1 J2
        else if (J1Jugada == J2Jugada)
        {
            if (mayorJ1 > mayorJ2)
            {
                J1Jugada = 1;
            }
            else if (mayorJ2 > mayorJ1)
            {
                J2Jugada = 1;
            }
        }
        // ----------------------
        // Empate J2 J3
        else if (J2Jugada == J3Jugada)
        {
            if (mayorJ2 > mayorJ3)
            {
                J2Jugada = 1;
            }
            else if (mayorJ3 > mayorJ2)
            {
                J3Jugada = 1;
            }
        }
        // Empate J3 J4
        else if (J3Jugada == J4Jugada)
        {
            if (mayorJ3 > mayorJ4)
            {
                J3Jugada = 1;
            }
            else if (mayorJ4 > mayorJ3)
            {
                J4Jugada = 1;
            }
        }
        // ----------------------
        // Empate J1 J3
        else if (J1Jugada == J3Jugada)
        {
            if (mayorJ1 > mayorJ3)
            {
                J1Jugada = 1;
            }
            else if (mayorJ3 > mayorJ1)
            {
                J3Jugada = 1;
            }
        }
        // Empate J1 J4
        else if (J1Jugada == J4Jugada)
        {
            if (mayorJ1 > mayorJ4)
            {
                J1Jugada = 1;
            }
            else if (mayorJ4 > mayorJ1)
            {
                J4Jugada = 1;
            }
        }
        // Empate J2 J4
        else if (J2Jugada == J4Jugada)
        {
            if (mayorJ2 > mayorJ4)
            {
                J2Jugada = 1;
            }
            else if (mayorJ4 > mayorJ4)
            {
                J4Jugada = 1;
            }
        }
    }

    // Esta comentado porque al crearse siempre que se inicia el codigo, los datos a guardar se reescriben
    //historialBase(); // Titulo y parte superior del txt

    // Si alguno de los jugadores gana (si es el caso sera igualado en 1)
    // se muestra un mensaje en pantalla que es el ganador y ademas
    // llama la funcion para ser escrito en el archivo .txt

    cout << "\t    ____________________________________________________" <<endl;

    string mensajeGanador = "";
    if (J1Jugada == 1)
    {
        cout << endl << "\t\t|\tEl ganador fue: " << jugadores[0] << "..!!!\t|" << endl;
        mensajeGanador = "- Ganador: " + jugadores[0];
        HistorialAgregada(mensajeGanador);
    }
    else if (J2Jugada == 1)
    {
        cout << endl << "\t\t|\tEl ganador fue: " << jugadores[1] << "..!!!\t|" << endl;
        mensajeGanador = "- Ganador: " + jugadores[1];
        HistorialAgregada(mensajeGanador);
    }
    else if (J3Jugada == 1)
    {
        cout << endl << "\t\t|\tEl ganador fue: " << jugadores[2] << "..!!!\t|" << endl;
        mensajeGanador = "- Ganador: " + jugadores[2];
        HistorialAgregada(mensajeGanador);
    }
    else if (J4Jugada == 1)
    {
        cout << endl << "\t\t|\tEl ganador fue: " << jugadores[3] << "..!!!\t|" << endl;
        mensajeGanador = "- Ganador: " + jugadores[3];
        HistorialAgregada(mensajeGanador);
    }
    else
    {
        cout << endl << "\t\t|\tNo hubo un desempate digno por falta de tiempo...\t|" << endl << endl;
        //mensajeGanador = "- No hubo un desempate digno...";
        //HistorialAgregada(mensajeGanador);
    }
    cout << "\t    ____________________________________________________" <<endl;

    /*cout << endl << J1Jugada << endl << mayorJ1 << endl << endl;

   cout << endl << J2Jugada << endl << mayorJ2 << endl << endl;
   
   cout << endl << J3Jugada << endl << mayorJ3 << endl << endl;

   cout << endl << J4Jugada << endl << mayorJ4 << endl << endl;
    */
}