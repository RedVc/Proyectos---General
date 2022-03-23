/* Redwin valverde Castro
   21/04/2021
*/
#include <string>
#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

// _______________________________________ EJERCICIO 1: _______________________________________
void ejercicio1(){
    system("cls");
    system("color 9");
    cout << "Ejercicio 1:" << endl << endl;
    cout << setw(20) << "ESTUDIANTE" << setw(30) << "PROMEDIO DEL CURSO" << endl;
    cout << setw(20) << "----------" << setw(30) << "------------------" << endl; 
    cout << setw(15) << 1 << setw(28) << 84.5 << endl;
    cout << setw(15) << 2 << setw(28) << 67.2 << endl;
    cout << setw(15) << 3 << setw(28) << 77.4 << endl;
    cout << setw(15) << 4 << setw(28) << 86.8 << endl;
    cout << setw(15) << 5 << setw(28) << 94.7 << endl << endl;

    system("pause");
}
// _______________________________________ EJERCICIO 2: _______________________________________
void ejercicio2(){
    int A = 0, B = 0;
    double resultado = 0;
    system("color 9");

    do
    {
        system("cls");
        cout << "Ejercicio 2:" <<  endl << endl;
        cout << "Ingrese dos numeros enteros mayores a 0 para dividirlos entre si." << endl;
        cout << "Primer numero(A): ";
        cin >> A;
    } while (A <= 0);
    do
    {
        system("cls");
        cout << "Ejercicio 2:" <<  endl << endl;
        cout << "Ingrese dos numeros enteros mayores a 0 para dividirlos entre si." << endl;
        cout << "Segundo numero(B): ";
        cin >> B;
    } while (B <= 0);

    resultado = static_cast<double>(A) / static_cast<double>(B);

    system("cls");
    cout << "Ejercicio 2:" <<  endl << endl;
    cout << "Primer numero: " << A << endl << "Segundo numero: " << B << endl << endl; 
    cout << "Resultado completo: " << resultado << endl << endl;
    cout << fixed;
    cout << "Resultado con 3 de presicion: " << setprecision(3) << resultado << endl;
    cout << "Resultado con 2 de presicion: " << setprecision(2) << resultado << endl;
    cout << "Resultado con 1 de presicion: " << setprecision(1) << resultado << endl;
    cout << "Resultado con 0 de presicion: " << setprecision(0) << resultado << endl << endl;


    system("pause");
}
// _______________________________________ EJERCICIO 3: _______________________________________
void ejercicio3(){
    long double tamanio = 0;
    int medida1 = 0, medida2 = 0;
    string unidad1 = "", unidad2 = "";

    system("color 9");
    do // ---------------- Tamanio del archivo -------------------
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << "Ingrese el tamano de un archivo: " << endl << "Debe ser mayor a 0: ";
        cin >> tamanio;
    } while (tamanio <= 0);
    
    do
    { // ---------------- Unidad de medida -------------------
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << "1. KB (KiloBytes)" << endl << "2. MB (MegaBytes)" << endl << "3. GB (GigaBytes)" << endl;
        cout << endl << "Cual es su unidad de medida\? ";
        cin >> medida1;
    } while (medida1 < 1 || medida1 > 3);
    
    switch (medida1)
    {
    case 1:
        unidad1 = "KB";
        break;
    
    case 2:
        unidad1 = "MB";
        break;
    
    case 3:
        unidad1 = "GB";
        break;
    }

    do // ------------------ Unidad de medida a convertir ------------------
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << "1. KB (KiloBytes)" << endl << "2. MB (MegaBytes)" << endl << "3. GB (GigaBytes)" << endl;
        cout << endl << "Cual es su unidad de medida a convertir\? ";
        cin >> medida2;
    } while (medida2 < 1 || medida2 > 3);

    switch (medida2)
    {
    case 1:
        unidad2 = "KB";
        break;
    
    case 2:
        unidad2 = "MB";
        break;
    
    case 3:
        unidad2 = "GB";
        break;
    }
    // ------------------------------------ KB ------------------------------------
    if (unidad1 == "KB" && unidad2 == "KB")
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << "El resultado es el mismo: " << tamanio << " " << unidad1 << endl << endl;
        system("pause");
    }
    else if (unidad1 == "KB" && unidad2 == "MB")
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << tamanio << " " << unidad1 << " a " << unidad2 << endl << endl;
        tamanio /= 1024;
        cout << "El resultado es: " << tamanio << " " << unidad2 << endl << endl;
        system("pause");
    }
    else if (unidad1 == "KB" && unidad2 == "GB")
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << tamanio << " " << unidad1 << " a " << unidad2 << endl << endl;
        tamanio /= 2048;
        cout << "El resultado es: " << tamanio << " " << unidad2 << endl << endl;
        system("pause");
    }
    // ------------------------------------ MB ------------------------------------
    if (unidad1 == "MB" && unidad2 == "MB")
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << "El resultado es el mismo: " << tamanio << " " << unidad1 << endl << endl;
        system("pause");
    }
    else if (unidad1 == "MB" && unidad2 == "KB")
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << tamanio << " " << unidad1 << " a " << unidad2 << endl << endl;
        tamanio *= 1024;
        cout << "El resultado es: " << tamanio << " " << unidad2 << endl << endl;
        system("pause");
    }
    else if (unidad1 == "MB" && unidad2 == "GB")
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << tamanio << " " << unidad1 << " a " << unidad2 << endl << endl;
        tamanio = tamanio / 1024;
        cout << "El resultado es: " << tamanio << " " << unidad2 << endl << endl;
        system("pause");
    }
    // ------------------------------------ GB ------------------------------------
    if (unidad1 == "GB" && unidad2 == "GB")
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << "El resultado es el mismo: " << tamanio << " " << unidad1 << endl << endl;
        system("pause");
    }
    else if (unidad1 == "GB" && unidad2 == "KB")
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << tamanio << " " << unidad1 << " a " << unidad2 << endl << endl;
        tamanio *= 2048;
        cout << "El resultado es: " << tamanio << " " << unidad2 << endl << endl;
        system("pause");
    }
    else if (unidad1 == "GB" && unidad2 == "MB")
    {
        system("cls");
        cout << "Ejercicio 3:" << endl << endl;
        cout << tamanio << " " << unidad1 << " a " << unidad2 << endl << endl;
        tamanio *= 1024;
        cout << "El resultado es: " << tamanio << " " << unidad2 << endl << endl;
        system("pause");
    }
}
// _______________________________________ EJERCICIO 4: _______________________________________
void ejercicio4(){
    int fahrenheit = 0;
    float celsius = 0;

    system("cls");
    system("color 9");
    cout << "Ejercicio 4:" << endl << endl;
    cout << "Ingrese una temperatura Fahrenheit entera para convertirla a Calsius. ";
    cin >> fahrenheit;

    celsius = (fahrenheit - 32) / 1.8f;

    system("cls");
    cout << "Ejercicio 4:" << endl << endl;
    cout << fahrenheit << " Fahrenheit en Celsius es: " << showpos << setprecision(3) << celsius << endl << endl;
    system("pause"); 
}
// _______________________________________ EJERCICIO 5: _______________________________________
void ejercicio5(){
    int notas[5], ausencias[5];
    
    system("cls");
    system("color 9");
    cout << "Ejercicio 5:" << endl << endl;
    cout << "Ingrese las notas y ausencias de 5 estudiantes" << endl << endl;
    system("pause");

    // Ingreso de los datos a los arreglos
    for (int i = 0; i < 5; i++)
    {
        system("cls");
        cout << "Ejercicio 5:" << endl << endl;
        cout << "Estudiante " << i+1 << endl;
        cout << "Ingrese la nota: ";
        cin >> notas[i];

        system("cls");
        cout << "Ejercicio 5:" << endl << endl;
        cout << "Estudiante " << i+1 << endl;
        cout << "Ingrese las ausensias: ";
        cin >> ausencias[i];
    }

    system("cls");
    cout << "Ejercicio 5:" << endl << endl;
    // Muestra el contenido de los arreglos
    for (int i = 0; i < 5; i++)
    {
        cout << "Esdudiante " << i+1 << ".\tNota: " << notas[i] << ".\tAusencias: " << ausencias[i] << endl;
    }
    
    cout << endl << endl;

    // Determina las condiciones de cada estudiante
    for (int i = 0; i < 5; i++)
    {
        if (notas[i] >= 70 && ausencias[i] < 2)
        {
            cout << "El estudiante " << i+1 << " \"Aprobo\"" << endl; 
        }
        else if (notas[i] >= 60 && notas[i] <= 69 && ausencias[i] < 2)
        {
            cout << "El estudiante " << i+1 << " \"Aplazo\"" << endl;
        }
        else if (notas[i] < 60)
        {
            cout << "El estudiante " << i+1 << " \"Reprobo\"" << endl;
        }
        else if (ausencias[i] >= 2)
        {
            cout << "El estudiante " << i+1 << " \"Reprobo\"" << endl;
        }
    }
    cout << endl;
    system("pause");
}
// _______________________________________ EJERCICIO 6: _______________________________________
void ejercicio6(){
    string nombre[10];
    double salarioH[10], horas[10], sBruto = 0, suma = 0;

    system("color 9");
    system("cls");

    cout << "Ejercicio 6:" << endl << endl;
    cout << "ingrese el nombre de 10 empleados, su salario por hora y las horas trabajadas." << endl << endl;
    system("pause");

    for (int i = 0; i < 10; i++)
    {
        system("cls");
        cout << "Ejercicio 6:" << endl << endl;
        cout << "Empleado: " << i+1 << endl;
        cout << "Ingrese el primer nombre del empleado: ";
        cin >> nombre[i];

        system("cls");
        cout << "Ejercicio 6:" << endl << endl;
        cout << "Empleado: " << i+1 << endl;
        cout << "Ingrese el salario por hora: ";
        cin >> salarioH[i];

        system("cls");
        cout << "Ejercicio 6:" << endl << endl;
        cout << "Empleado: " << i+1 << endl;
        cout << "Ingrese las horas trabajadas: ";
        cin >> horas[i];
    }
    system("cls");
    cout << "Ejercicio 6:" << endl << endl;
    cout << "Si trabajo mas de 40 horas, obtendra un aumento del 50% en las horas extra" << endl;
    cout << "Los datos ingresados son:" << endl << endl;

    for (int i = 0; i < 10; i++)
    {
        cout << nombre[i] << setw(30) << "\tSalario: " << salarioH[i] << setw(30) << "\tHoras: " << horas[i] << setw(30) << "Salario Bruto: ";

        if (horas[i] > 40)
        {
            salarioH[i] = salarioH[i] + salarioH[i] * (50/100);
        }
        
        suma = salarioH[i] * horas[i];
        cout << suma << endl;
        suma = 0;
    }
    cout << endl;
    system("pause");

    system("cls");
    cout << "Ejercicio 6:" << endl << endl;
    cout << "Los datos resueltos son:" << endl << endl;
    
    system("pause");
}
// _______________________________________ EJERCICIO 7: _______________________________________
void ejercicio7(){

    system("cls");
    system("color 9");
    cout << "Ejercicio 7:" << endl << endl;
    cout << "Lo siento profe, no me alcanzo el tiempo para idear un buen codigo." << endl << endl;

    system("pause");
}
// _______________________________________ EJERCICIO 8: _______________________________________
void ejercicio8(){
    int N = 0;
    system("color 9");
    do
    {
        system("cls");
        cout << "Ejercicio 8:" << endl << endl;
        cout << "Ingrese un numero entero para calcular las combinaciones" << endl;
        cout << "en las que se puede obtener este mismo de dos dados." << endl;
        cout << "Debe ser del 2 al 12: ";
        cin >> N;
    } while (N <= 1 || N > 12);
    
    if (N == 2)
    {
        cout << endl << endl << "1+1." << endl << endl;
    }
    else if (N == 3)
    {
        cout << endl << endl << "1+2, 2+1." << endl << endl;
    }
    else if (N == 4)
    {
        cout << endl << endl << "1+3, 2+2, 3+1." << endl << endl;
    }
    else if (N == 5)
    {
        cout << endl << endl << "1+4, 2+3, 3+2, 4+1." << endl << endl;
    }
    else if (N == 6)
    {
        cout << endl << endl << "1+5, 2+4, 3+3, 4+2, 5+1." << endl << endl;
    }
    else if (N == 7)
    {
        cout << endl << endl << "1+6, 2+5, 3+4, 4+3, 5+2, 6+1." << endl << endl;
    }
    else if (N == 8)
    {
        cout << endl << endl << "1+7, 2+6, 3+5, 4+4, 5+3, 6+2, 7+1." << endl << endl;
    }
    else if (N == 9)
    {
        cout << endl << endl << "1+8, 2+7, 3+6, 4+5, 5+4, 6+3, 7+2, 8+1." << endl << endl;
    }
    else if (N == 10)
    {
        cout << endl << endl << "1+9, 2+8, 3+7, 4+6, 5+5, 6+4, 7+3, 8+2, 9+1." << endl << endl;
    }
    else if (N == 11)
    {
        cout << endl << endl << "1+10, 2+9, 3+8, 4+7, 5+6, 6+5, 7+4, 8+3, 9+2, 10+1." << endl << endl;
    }
    else if (N == 12)
    {
        cout << endl << endl << "1+11, 2+10, 3+9, 4+8, 5+7, 6+6, 7+5, 8+4, 9+3, 10+2, 11+1." << endl << endl;
    }
    system("pause");
}
// _______________________________________ EJERCICIO 9: _______________________________________
void ejercicio9(){
    int negativo = 0, positivo = 0, n = 0;
    bool entra = false;

    system("color 9");
    system("cls");
    cout << "Ejercicio 8:" << endl << endl;
    cout << "Ingrese valores enteros, finalice con 0." << endl;

    while (entra == false)
    {
        cin >> n;
        if (n == 0)
        {
            break;
        }
        else if (n <= -1)
        {
            negativo++;
        }
        else if (n >= 1)
        {
            positivo++;
        }
    }

    cout << "Positivos: ";
    for (int i = 0; i < positivo; i++)
    {
        cout << "*";
    }
    cout << endl;
    
    cout << "Negativos: ";
    for (int i = 0; i < negativo; i++)
    {
        cout << "*";
    }
    cout << endl << endl;

    system("pause");
}