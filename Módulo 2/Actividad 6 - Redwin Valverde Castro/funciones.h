#include <iostream>
#include <stdlib.h>
#include <fstream>
#include <string>
using namespace std;

// ________________________________ MostrarMatriz ________________________________
// Funcion para mostrar la matriz, NO retorna y recibe la matriz

void MostrarMatriz(int matriz[10][5]){

    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            // Si el contenido de la matriz es menor a 10 genera mas espacios
            if (matriz[i][j] < 10)
            {
                cout << " |   " << matriz[i][j];    
            }
            // Si el contenido de la matriz es menor a 100 genera un espacio menos
            else if (matriz[i][j] < 100)
            {
                cout << " |  " << matriz[i][j];
            }
            // Si el contenido de la matriz es diferente a lo anterior
            else
            {
                cout << " | " << matriz[i][j];
            }
        }
        cout << " | " << endl;
    }
}

// _________________________________ esPrimo _________________________________
// Funcion para verificar si el numero es primo, retorna un bool y recibe un entero

bool esPrimo(int numero){
    // Casos especiales
    if (numero == 0 || numero == 1 || numero == 4)
    {
        return false; // Si el numero que entra es alguno de los anteriores, retorna en false
    }
    for (int i = 2; i < numero / 2; i++)
    {
        if ((numero % i) == 0)
        {
           return false; // Si el numero es divisible entre i y es igual a 0, retorna en false
        }
    }
    // Si no se pudo dividir por ninguno de los de arriba, sí es primo
    return true;
}

// ______________________________ AgregarTextoFinal ____________________________
// Funcion que agrega un, NO retorna y NO recibe parametros

void AgregarTextoFinal(){
    ofstream Primos;

    Primos.open("PRIMOS.txt", ios::app);

    if (Primos.fail())
    {
        cout << "Se produjo un error abriendo el archivo";
        exit(1);
    }

    string texto;
    cout << endl << "Ingrese un texto:" << endl;
    getline(cin, texto);
    Primos << endl << texto << endl;

    Primos.close();
}

// ______________________________ Actividad6 ____________________________
// Funcion que contiene la actividad 6, NO retorna y NO recibe parametros

void Actividad6(){
    // Matriz de 10 lineas y 5 columnas
    int matriz[10][5];
    // Contador para verificar el numero si es primo
    int contador = 1;

    system("cls");

    // Ciclo para verificar y agregar un numero primo a la matriz
    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            while(true) // Siempre entra
            {
                contador++; // Aumenta en 1 para el ingreso
                // llama la funcion y verifica si es primo o no con una funcion bool
                if (esPrimo(contador) == true) 
                {
                    matriz[i][j] = contador; // Agrega el numero a la matriz
                    break;
                }
            }
        }// j
    }// i

    // Muestra la matriz
    MostrarMatriz(matriz);

    ofstream Primos;
    Primos.open("PRIMOS.txt", ios::out);

    if (Primos.fail())
    {
        cout << "Se produjo un error abriendo el archivo";
        exit(1);
    }
    // Bloque de codigo para los datos del blog de notas (.txt)
    Primos << "_______________________________________________________________" << endl;
    Primos << "______ Redwin Valverde Castro :: Andres Villalobos Mejia ______" << endl;
    Primos << "_______________________________________________________________" << endl << endl;

    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            // Si el contenido de la matriz es menor a 10 genera mas espacios
            if (matriz[i][j] < 10)
            {
                Primos << "\t" << " |   " << matriz[i][j];    
            }
            // Si el contenido de la matriz es menor a 100 genera un espacio menos
            else if (matriz[i][j] < 100)
            {
                Primos << "\t" << " |  " << matriz[i][j];
            }
            // Si el contenido de la matriz es diferente a lo anterior
            else
            {
                Primos << "\t" << " | " << matriz[i][j];
            }
        }
        Primos << " | " << endl;
    }
    Primos << endl << "_______________________________________________________________" << endl << endl;
    Primos << "Texto adicional agregado:" << endl << endl;
    
    Primos.close();
    
}