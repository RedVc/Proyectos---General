#include <iostream>
#include <string>
#include <time.h>
#include <stdlib.h>
#include <iomanip>
using namespace std;

void LlenarMatriz(string Matriz[7][7], string valor) // Sirve
{
    for (int i = 0; i < 7; i++)
    {
        for (int j = 0; j < 7; j++)
        {
            Matriz[i][j] = valor;
        }
    }
}
/*
_____________________________________ FUNCIÓN MOSTRAR EL CONTENIDO DE UNA MATRIZ _____________________________________
*/
void MostrarMatriz(string Matriz[7][7])
{
    cout << setw(15) << "Col" << setw(5) << "Col" << setw(5) << "Col" << setw(5) << "Col" << setw(5) << "Col" << setw(5) << "Col" << setw(5) << "Col" << endl;
    cout << setw(14) << 1 << setw(5) << 2 << setw(5) << 3 << setw(5) << 4 << setw(5) << 5 << setw(5) << 6 << setw(5) << 7 << endl;
    cout << setw(45) << "_________________________________" << endl << endl;
    for (int i = 0; i < 7; i++)
    {
        cout << "Fila " << i+1 << "\t|";
        for (int j = 0; j < 7; j++)
        {
            cout << "   " << setw(2) << Matriz[i][j];
        }
        cout << "   " << endl << endl;
    }
}
void generarMinas(string matriz[7][7])
{
    srand(time(NULL));
    int A = rand() % 7; 
    int B = rand() % 7;
    int n = 1;

    while (matriz[A][B] == "M")
    {
        A = rand() % 7;
        B = rand() % 7;
    }
    matriz[A][B] = "M";
}
void generarNumeros(string matriz[7][7]){
    int cantidad = 0;
    // __________________________________________ Interiores __________________________________________
    for (int i = 1; i < 6; i++)
    {
        for (int j = 1; j < 6; j++)
        {
            if (matriz[i][j] != "M")
            {
                if (matriz[i - 1][j - 1] == "M")
                {
                    cantidad++;
                }
                if (matriz[i - 1][j] == "M")
                {
                    cantidad++;
                }
                if (matriz[i - 1][j + 1] == "M")
                {
                    cantidad++;
                }
                if (matriz[i][j - 1] == "M")
                {
                    cantidad++;
                }
                if (matriz[i][j + 1] == "M")
                {
                    cantidad++;
                }
                if (matriz[i + 1][j - 1] == "M")
                {
                    cantidad++;
                }
                if (matriz[i + 1][j] == "M")
                {
                    cantidad++;
                }
                if (matriz[i + 1][j + 1] == "M")
                {
                    cantidad++;
                }
                matriz[i][j] = to_string(cantidad);
                cantidad = 0;
            }
        }
    }
    // __________________________________________ Esquinas __________________________________________
    // Esquina Superior Izquierda
    if (matriz[0][0] != "M")
    {
        if (matriz[0][1] == "M")
        {
            cantidad++;
        }
        if (matriz[1][0] == "M")
        {
            cantidad++;
        }
        if (matriz[1][1] == "M")
        {
            cantidad++;
        }
        matriz[0][0] = to_string(cantidad);
        cantidad = 0;
    }

    // Esquina Superior Derecha
    if (matriz[0][6] != "M")
    {
        if (matriz[0][5] == "M")
        {
            cantidad++;
        }
        if (matriz[1][5] == "M")
        {
            cantidad++;
        }
        if (matriz[1][6] == "M")
        {
            cantidad++;
        }
        matriz[0][6] = to_string(cantidad);
        cantidad = 0;
    }

    // Esquina Inferior Izquierda
    if (matriz[6][0] != "M")
    {
        if (matriz[5][0] == "M")
        {
            cantidad++;
        }
        if (matriz[5][1] == "M")
        {
            cantidad++;
        }
        if (matriz[6][1] == "M")
        {
            cantidad++;
        }
        matriz[6][0] = to_string(cantidad);
        cantidad = 0;
    }
    // Esquina Inferior Derecha
    if (matriz[6][6] != "M")
    {
        if (matriz[6][5] == "M")
        {
            cantidad++;
        }
        if (matriz[5][5] == "M")
        {
            cantidad++;
        }
        if (matriz[5][6] == "M")
        {
            cantidad++;
        }
        matriz[6][6] = to_string(cantidad);
        cantidad = 0;
    }
    // __________________________________________ Horizontal Superior __________________________________________
    for (int j = 1; j < 6; j++)
    {
        if (matriz[0][j] != "M")
        {
            if (matriz[0][j-1] == "M")
            {
                cantidad++;
            }
            if (matriz[0][j+1] == "M")
            {
                cantidad++;
            }
            if (matriz[1][j-1] == "M")
            {
                cantidad++;
            }
            if (matriz[1][j] == "M")
            {
                cantidad++;
            }
            if (matriz[1][j+1] == "M")
            {
                cantidad++;
            }
            matriz[0][j] = to_string(cantidad);
            cantidad = 0;
        }   
    }
    // __________________________________________ Horizontal Inferior __________________________________________
    for (int j = 1; j < 6; j++)
    {
        if (matriz[6][j] != "M")
        {
            if (matriz[6][j-1] == "M")
            {
                cantidad++;
            }
            if (matriz[6][j+1] == "M")
            {
                cantidad++;
            }
            if (matriz[5][j-1] == "M")
            {
                cantidad++;
            }
            if (matriz[5][j] == "M")
            {
                cantidad++;
            }
            if (matriz[5][j+1] == "M")
            {
                cantidad++;
            }
            matriz[6][j] = to_string(cantidad);
            cantidad = 0;
        }   
    }
    // __________________________________________ Vertical Izquierdo __________________________________________
    for (int i = 1; i < 6; i++)
    {
        if (matriz[i][0] != "M")
        {
            if (matriz[i-1][0] == "M")
            {
                cantidad++;
            }
            if (matriz[i-1][1] == "M")
            {
                cantidad++;
            }
            if (matriz[i][1] == "M")
            {
                cantidad++;
            }
            if (matriz[i+1][0] == "M")
            {
                cantidad++;
            }
            if (matriz[i+1][1] == "M")
            {
                cantidad++;
            }
            matriz[i][0] = to_string(cantidad);
            cantidad = 0;
        }
    }
    // __________________________________________ Vertical Derecho __________________________________________
    for (int i = 1; i < 6; i++)
    {
        if (matriz[i][6] != "M")
        {
            if (matriz[i-1][5] == "M")
            {
                cantidad++;
            }
            if (matriz[i-1][6] == "M")
            {
                cantidad++;
            }
            if (matriz[i][5] == "M")
            {
                cantidad++;
            }
            if (matriz[i+1][5] == "M")
            {
                cantidad++;
            }
            if (matriz[i+1][6] == "M")
            {
                cantidad++;
            }
            matriz[i][6] = to_string(cantidad);
            cantidad = 0;
        }
    }
}
void Juego(){
    string matriz1[7][7], matriz2[7][7];
    int acumulable = 0, fila = 0, columna = 0, ganar = 0;
    bool derrota = false, gane = false;

    system("cls");
    LlenarMatriz(matriz1, "*");
    do
    {
        generarMinas(matriz2);
        acumulable++;
    } while (acumulable < 18);
    
    generarNumeros(matriz2);

    do
    {
        ganar = 0;
        do
        {
            system("cls");
            MostrarMatriz(matriz1);
            //MostrarMatriz(matriz2);
            cout << endl << "Elija su jugada:" << endl;
            cout << "Debe ser de 1 a 7:" << endl << endl;
            cout << "Fila:\t";
            cin >> fila;
        } while (fila < 1 || fila > 7);

        do
        {
            system("cls");
            MostrarMatriz(matriz1);
            //MostrarMatriz(matriz2);
            cout << endl << "Elija su jugada:" << endl;
            cout << "Debe ser de 1 a 7:" << endl << endl;
            cout << "Tu fila fue: " << fila << endl;
            cout << "Columna: ";
            cin >> columna;
        } while (columna < 1 || columna > 7);

        fila--;
        columna--;
        matriz1[fila][columna] = matriz2[fila][columna];
    
        if (matriz1[fila][columna] == "M")
        {
            derrota = true;
        }

        for (int fila = 0; fila < 7; fila++)
        {
            for (int columna = 0; columna < 7; columna++)
            {
                if (matriz1[fila][columna] != "*")
                {
                    ganar++;
                }
            }  
        }
        if (ganar >= 31)
        {
            gane = true;
        }
        ganar = 0;

    } while (derrota == false && gane == false);

    if (gane == true)
    {
        system("cls");
        MostrarMatriz(matriz2);
        cout << endl << "Ganaste!!!!!!" << endl << endl;
    }
    
    if (derrota == true)
    {
        system("cls");
        MostrarMatriz(matriz2);
        cout << endl << "Perdiste!!!!!!" << endl << endl;
    }
    
}