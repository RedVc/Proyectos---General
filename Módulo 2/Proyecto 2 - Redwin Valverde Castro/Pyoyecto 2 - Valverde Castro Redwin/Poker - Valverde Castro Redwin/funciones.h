#include "ganador.h"
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
_____________________________________ FUNCIÓN LLENAR MATRIZ _____________________________________
Recibe una matriz de bool de 4 filas por 13 columnas y un bool
No retorna nada
Llena toda la matriz con el valor bool indicado
Simbología:
    false    significa que la carta no está en la matriz
    true     significa que la carta si está en la matriz

    Al inicio del juego el MazoCartas tiene todas sus cartas en true
    Y las matrices de los 3 jugadores tienen todas sus cartas en false
*/

void LlenarMatriz(bool Matriz[4][13], bool valor)
{
    for (int i = 0; i <= 3; i++)
    {
        for (int j = 0; j <= 12; j++)
        {
            Matriz[i][j] = valor;
        }
    }
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
_____________________________________ FUNCIÓN MOSTRAR EL CONTENIDO DE UNA MATRIZ _____________________________________
*/
void MostrarMatriz(bool Matriz[4][13])
{
    for (int i = 0; i <= 3; i++)
    {
        for (int j = 0; j <= 12; j++)
        {
            cout << " | " << Matriz[i][j];
        }
        cout << " |" << endl;
    }
}
// fin __________ mostrar el contenido de la matriz

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
_____________________________________ FUNCIÓN DAR UNA CARTA _____________________________________
No retorna nada
Recibe dos matrices
Toma al azar una carta de la matriz MazoCartas (marca que se tomó esa carta con un flag), y 
asigna esa carta al jugador (marcando en la matriz del jugador con un flag que ahora tiene esa carta)
*/

void darUnaCarta(bool MazoCartas[4][13], bool CartasJugador[4][13])
{
    srand(time(NULL));
    int A = rand() % 4;  // un número entre 0 y 3 para la fila
    int B = rand() % 13; // un número entre 0 y 12 para la columna  ********** ESTABA EN 14, ERA UN ERROR *************************************************

    // garantizar que la carta elegida no sea una carta que ya se utilizó
    while (MazoCartas[A][B] == 0)
    {
        // Si la posición tiene el flag 1 significa que ya fue utilizada, 0 significa que está disponible
        A = rand() % 4;
        B = rand() % 13; // ********** ESTABA EN 14, ERA UN ERROR *************************************************
    }

    MazoCartas[A][B] = false;    // marcar con un FLAG que esa posición ya está en uso
    CartasJugador[A][B] = true; // en las cargas del jugador este flag indica que ahora posee esa carta

    // Nota: no hace falta comprobar en la matriz del usuario, ya que no es posible que ya tenga 
    // previamente una carta que aún está en el mazo
}
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
_____________________________________ FUNCIÓN MOSTRAR CARTAS _____________________________________
No retorna nada
Recibe una matriz y un booleano 'formatoMazo' que indica si debe mostrar en varias líneas las cartas separadas por cada palo
(para mostrar el mazo), y además mostrar un espacio en blanco en donde se quitó una carta del mazo,
o si debe mostrar las cartas en la misma línea (para los jugadores)

Recorre la matriz y muestra solamente aquellos valores que sean UNO

Se interpretarán los palos de esta manera:
    
    Fila 0: corazones 
    Fila 1: diamantes 
    Fila 2: tréboles
    fila 3: espadas

    Muestra en pantalla el caracter de cada palo y la carta
*/

void MostrarCartas(bool Matriz[4][13], bool formatoMazo)
{
    //int contador = 0;
    char corazon = 'c';  // ♥        FILA 0
    char diamante = 'd'; // ♦        FILA 1
    char trebol = 't';   // ♣        FILA 2
    char espada = 's';   // ♠        FILA 3

    for (int i = 0; i <= 3; i++)
    {
        for (int j = 0; j <= 12; j++)
        {
            if (Matriz[i][j] == true)
            { // si es una carta activa

                if (j >= 0 && j <= 8)
                {
                    cout << setw(2) << j + 2;
                }
                else if (j == 9)
                {
                    cout << setw(2) << "J";
                }
                else if (j == 10)
                {
                    cout << setw(2) << "Q";
                }
                else if (j == 11)
                {
                    cout << setw(2) << "K";
                }
                else if (j == 12)
                { 
                    cout << setw(2) << "A";
                }

                switch (i)
                {
                case 0:
                    cout << corazon << " | ";
                    break;
                case 1:
                    cout << diamante << " | ";
                    break;
                case 2:
                    cout << trebol << " | ";
                    break;
                case 3:
                    cout << espada << " | ";
                    break;
                } // switch

            } // if

            else if (formatoMazo)
            {
                cout << "    | ";
            }
        }
        if (formatoMazo)
        {
            cout << endl;
        }
    }
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// ____________________________ Funcion MostrarCartasMayor ______________________________________
// ______________________________________________________________________________________________
// Recibe una matriz para mostrar su contenido en orden mayor a menor, todas bool

void MostrarCartasMayor(bool Matriz[4][13], bool formatoMazo)
{
    //int contador = 0;
    char corazon = 'c';  // ♥        FILA 0
    char diamante = 'd'; // ♦        FILA 1
    char trebol = 't';   // ♣        FILA 2
    char espada = 's';   // ♠        FILA 3

    for (int j = 12; j >= 0; j--)
    {
        for (int i = 3; i >= 0; i--)
        {
            if (Matriz[i][j] == true)
            { // si es una carta activa

                if (j >= 0 && j <= 8)
                {
                    cout << setw(2) << j + 2;
                }
                else if (j == 9)
                {
                    cout << setw(2) << "J";
                }
                else if (j == 10)
                {
                    cout << setw(2) << "Q";
                }
                else if (j == 11)
                {
                    cout << setw(2) << "K";
                }
                else if (j == 12)
                { 
                    cout << setw(2) << "A";
                }

                switch (i)
                {
                case 0:
                    cout << corazon << " | ";
                    break;
                case 1:
                    cout << diamante << " | ";
                    break;
                case 2:
                    cout << trebol << " | ";
                    break;
                case 3:
                    cout << espada << " | ";
                    break;
                } // switch

            } // if

            else if (formatoMazo)
            {
                cout << "    | ";
            }
        }
        if (formatoMazo)
        {
            cout << endl;
        }
    }
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// _____________________________ Funcion ReiniciarMatriz ________________________________________
// ______________________________________________________________________________________________
// Recibe las matrices para reiniciarlas, todas bool

void ReiniciarMatrices(bool las7Cartas[4][13], bool manoJugador[4][13], bool CartasJugador[4][13], bool Mesa[4][13]){
    
    LlenarMatriz(las7Cartas, false);
    LlenarMatriz(manoJugador, false);

    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 13; j++)
        {
            if (CartasJugador[i][j] == true || Mesa[i][j] == true)
            {
                las7Cartas[i][j] = true;
            }
        } // j
    } // i
}

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// _______________________________ Funcion NombreMano ___________________________________________
// ______________________________________________________________________________________________

string NombreMano(int jugada){
    string mano = "";

    switch (jugada)
    {
    case 1:
        mano = ": Escalera real >-";
        break;
    case 2:
        mano = ": Escalera de color >-";
        break;
    case 3:
        mano = ": Poker >-";
        break;
    case 4:
        mano = ": Full >-";
        break;
    case 5:
        mano = ": Color >-";
        break;
    case 6:
        mano = ": Escalera >-";
        break;
    case 7:
        mano = ": Trio >-";
        break;
    case 8:
        mano = ": Doble pareja >-";
        break;
    case 9:
        mano = ": Pareja >-";
        break;
    case 10:
        mano = ": Carta alta >-";
        break;
    }
    return mano;
}
// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// __________________________ Funcion DeterminarMejorMano ______________________________________
// ______________________________________________________________________________________________

void DeterminarMejorMano(bool CartasJugador[4][13],
                         bool Mesa[4][13], 
                         bool manoJugador[4][13],
                         int &numeroMejorJugada,
                         int &desempate)
{
    // las7Cartas contendra las 2 cartas del jugador mas las 5 cartas de la mesa
    bool las7Cartas[4][13];
    LlenarMatriz(las7Cartas, false);
    bool paso = false;

    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 13; j++)
        {
            if (CartasJugador[i][j] == true || Mesa[i][j] == true)
            {
                las7Cartas[i][j] = true;
            }
        } // j
    } // i

    // Una variable que indique cual fue la jugada que se logro formar
    // -1 significa que no se ha formado ninguna jugada
    numeroMejorJugada = -1;

    // __________________________ JUGADA 1: ESCALERA REAL ___________________________________________
    // ______________________________________________________________________________________________
    // De un mismo palo, las 5 cartas consecutivas del 10 al As

    int contador = 0;
    // El siguiente contador funciona para sacar la carta mayor para el desempate
    int contadorMayor = 0;

    // Va de fila en fila
    for (int i = 0; i < 4; i++)
    {
        contador = 0;

        // Luego busca en las columnas especificas si las ultimas cartas van seguidas
        // para lograr una escalera real
        for (int j = 8; j < 13; j++)
        {
            // Si las7Cartas es true, el contador aumenta en 1
            if (las7Cartas[i][j] == true)
            {
                contador++;
            }
            // Si el contador es igual a 5, ingresa las cartas en la mano del jugador
            // y el numero de la jugada sera 1
            if (contador == 5)
            {
                numeroMejorJugada = 1;

                // Guarda en la matriz manoJugador las 5 cartas que forma la mano ganadora
                for (int laColumna = 8; laColumna < 13; laColumna++)
                {
                    manoJugador[i][laColumna] = true;
                } // laColumna
            }
        } // j
    } // i

    // __________________________ JUGADA 2: ESCALERA DE COLOR _______________________________________
    // ______________________________________________________________________________________________
    // 5 cartas en orden ascendente del mismo color

    if (numeroMejorJugada == -1)
    {
        ReiniciarMatrices(las7Cartas, manoJugador, CartasJugador, Mesa);
        contador = 0;
        
        for (int i = 3; i >= 0; i--)
        {
            contador = 0;
            contadorMayor = 0;
            for (int j = 12; j >= 0; j--)
            {
                // Si las7Cartas es true, aumenta el contador, de lo contrario sera 0
                if (las7Cartas[i][j] == true)
                {
                    contador++;
                }
                else
                {
                    contador = 0;
                }
                // Si el contador es 5 (porque hay 5 cartas seguidas) el numero de la jugada sera 2 y
                // luego esas cartas se ingresaran en la mano del jugador                
                if (contador == 5)
                {
                    numeroMejorJugada = 2;

                    for (int laColumna = j+4; laColumna >= j; laColumna--)
                    {
                        manoJugador[i][laColumna] = true;
                        contadorMayor++;

                        // Si contador mayor es igual a 1, se dara un entero para el desempate 
                        if (contadorMayor == 1)
                        {
                            desempate = j+2;
                        }
                        

                    } // laColumna
                }
            } // j
        } // i

    }// if -1

    // ________________________________ JUGADA 3: POKER _____________________________________________
    // ______________________________________________________________________________________________
    // 4 cartas iguales, la restante es la mayor

    if (numeroMejorJugada == -1)
    {
        ReiniciarMatrices(las7Cartas, manoJugador, CartasJugador, Mesa);

        paso = false;
        contador = 0;

        // Ciclo para determinar 4 cartas seguidas
        for (int j = 12; j >= 0; j--)
        {
            // Solo se necesita una fila para determinar si existen 4 iguales(podria estar escrito
            // directamente con 0, pero para mejor uso del break lo hice de esta manera)
            for (int i = 0; i >= 0; i--)
            {  
                if (las7Cartas[i][j] == true && las7Cartas[i+1][j] == true && las7Cartas[i+2][j] == true && las7Cartas[i+3][j] == true)
                {
                    // Si hay 4 iguales, las activa en la mano y desactiva las7Cartas, activa un 
                    // bool para escoger la carta mayor e iguala la mejor jugada a 3 para retornar y rompe el ciclo para pasar al siguiente
                    manoJugador[i][j] = true;
                    manoJugador[i+1][j] = true;
                    manoJugador[i+2][j] = true;
                    manoJugador[i+3][j] = true;

                    // Se desactivan para mejor uso del if de paso
                    las7Cartas[i][j] = false;
                    las7Cartas[i+1][j] = false;
                    las7Cartas[i+2][j] = false;
                    las7Cartas[i+3][j] = false;

                    numeroMejorJugada = 3;
                    // Activa un bool para dar inicio al siguiente if para la carta individual mayor
                    paso = true;
                    break;
                }
            }// i
        } // j

        if (paso == true)
        {
            int unaCarta = 0;
            for (int i = 3; i >= 0; i--)
            {
                for (int j = 12; j >= 0; j--)
                {
                    if (las7Cartas[i][j] == true)
                    {
                        manoJugador[i][j] = true;
                        unaCarta++;
                        
                        // En el momento que encuentra una carta, rompe el ciclo
                        // y agrega un entero para un desempate
                        if (unaCarta == 1)
                        {
                            desempate = j+2;
                            break;
                        }
                    }
                } // j
                if (unaCarta == 1)
                {
                    break;
                }
            }// i
        }

    }// if -1

    // _________________________________ JUGADA 4: FULL _____________________________________________
    // ______________________________________________________________________________________________
    // 3 cartas con un mismo numero y una pareja

    if (numeroMejorJugada == -1)
    {
        ReiniciarMatrices(las7Cartas, manoJugador, CartasJugador, Mesa);

        // Variables especiales
        paso = false;
        bool trio = false;
        contador = 0;

        // Recorre la matriz por sus columnas en orden cotrario
        for (int j = 12; j >= 0; j--)
        {
            for (int i = 0; i < 4; i++)
            {
                // Si las7Cartas es true aumenta el contador
                if (las7Cartas[i][j] == true)
                {
                    contador++;
                }
                // Si el contador es 3, activa el bool trio y luego ingresa las cartas a la mano del jugador
                if (contador == 3)
                {
                    //numeroMejorJugada = 4;
                    trio = true;

                    for (int fila = 0; fila < 4; fila++)
                    {
                        if (las7Cartas[fila][j] == true)
                        {
                            manoJugador[fila][j] = true;
                            las7Cartas[fila][j] = false;
                        } 
                    } 
                }
            }// i

            // El contador sera 0 si no encontro 3 cartas iguales
            contador = 0;
        }// j
     // Si trio = true, entonces buscar en las7Cartas(4) si existe una pareja
     // buscar de derecha a izquierda
     // Se crea otro bool por si la condicion se cumple
        bool pareja = false;

        // Si se encontro un trio en el ciclo anterior, el contador se iguala a 0
        // y el bool se declara como false
        if (trio == true)
        {
            contador = 0;
            pareja = false;
            contadorMayor = 0;

            // Recorre la matriz en orden decendente por sus columnas
            for (int j = 12; j >= 0; j--)
            {
                for (int i = 0; i < 4; i++)
                {
                    // Si las7Cartas es true, el contador aumenta en 1
                    // y aumenta en 1 el contador para un posible desempate
                    if (las7Cartas[i][j] == true)
                    {
                        contador++;
                    }
                    // Si el contador es igual a 2, pareja se activa y se ingresan dichas cartas a la mano del jugador
                    if (contador == 2)
                    {
                        pareja = true;

                        for (int fila = 0; fila < 4; fila++)
                        {
                            if (las7Cartas[fila][j] == true)
                            {
                                contadorMayor++;
                                manoJugador[fila][j] = true;
                                las7Cartas[fila][j] = false;
                            
                                if (contadorMayor == 1)
                                {
                                    desempate = j+2;
                                }
                                
                            }
                        }
                    }
                    if (contador == 2)
                    {
                        break;
                    }
                } // i
                contador = 0;
            } // j
        }
        // Si las dos condiciones bool estan activas, el numero de la jugada sera 4
        if (trio == true && pareja == true)
        {
            numeroMejorJugada = 4;
        }

    }// if -1

    // ________________________________ JUGADA 5: Color _____________________________________________
    // ______________________________________________________________________________________________
    // Las 5 cartas del mismo tipo

    if (numeroMejorJugada == -1)
    {
        ReiniciarMatrices(las7Cartas, manoJugador, CartasJugador, Mesa);

        contador = 0;
        int contAux = 0;
        contadorMayor = 0;

        // Se recorre la matriz por columnas y en orden descendente
        for (int i = 3; i >= 0; i--)
        {
            for (int j = 0; j < 13; j++)
            {
                // Si las7Cartas es true, el contador aumenta
                if (las7Cartas[i][j] == true)
                {
                    contador++;
                    
                    // Si el contador es igual a 5, la jugada sera 4 e ingresa las cartas a la mano del jugador
                    if (contador == 5)
                    {
                        numeroMejorJugada = 5;
                        
                        // Recorre solo las columnas manteniendo la fila actual
                        for (int columna = 12; columna >= 0; columna--)
                        {
                            
                            if (las7Cartas[i][columna] == true)
                            {
                                manoJugador[i][columna] = true;
                                contAux++;
                                contadorMayor++;

                                if (contadorMayor == 1)
                                {
                                    desempate = columna+2;
                                }
                                

                                // Si el contador auxiliar es igual a 5, rompe el ciclo
                                if (contAux == 5)
                                {
                                    break;
                                } 
                            }
                        }// columna
                    }
                }  
            }// j
            contador = 0;
        }// i

    }// if -1
    
    // _______________________________ JUGADA 6: Escalera ___________________________________________
    // ______________________________________________________________________________________________
    // Las 5 cartas en orden ascendente y de cualquier tipo

    // Sin terminar
    if (numeroMejorJugada == -1)
    {
        ReiniciarMatrices(las7Cartas, manoJugador, CartasJugador, Mesa);
        contador = 0;
        int contColum = 0;
        contadorMayor = 0;
        bool llenar = false;

        // Recorrre columnas
        for (int j = 12; j >= 0; j--)
        {
            // El contador auxiliar se iguala a 0 para dar un mejor inicio de si mismo
            contColum = 0;

            // Luego se recorre fila por fila
            for (int i = 3; i >= 0; i--)
            {
                // Si la posicion de la matriz es true, aumenta el contador principal en 1
                if (las7Cartas[i][j] == true)
                {
                    contador++;
                    
                    // Si el contador principal es 5, el numero de la jugada sera 6 y ademas,
                    // como las 5 cartas seguidas ya estan, se va a llenar la mano del jugador
                    if (contador == 5)
                    {
                        numeroMejorJugada = 6;

                        // ----------------------------------------------------------------------------------
                        // Empieza en j+4 porque es 5 posiciones atras para asi colocar las cartas adecuadas y va hasta j
                        for (int columna = j+4; columna >= j; columna--)
                        {
                            // Recorre las filas con normalidad
                            for (int fila = 3; fila >= 0; fila--)
                            {
                                // Si las7Cartas es true, la mano del jugador sera true y un break para pasar a la siguiente columna
                                if (las7Cartas[fila][columna] == true)
                                {
                                    manoJugador[fila][columna] = true;
                                    contadorMayor++;

                                    if (contadorMayor == 1)
                                    {
                                        desempate = columna+2;
                                    }

                                    break;
                                }
                            }// fila 
                        }// columna
                        // ----------------------------------------------------------------------------------
                    }
                    // Si es true, hace un break para pasar al siguiente ciclo de la columna
                    break;
                }
                // (Puede ir en un else) Si es false, el contador auxiliar aumenta en 1
                if (las7Cartas[i][j] == false)
                {
                    contColum++;
                }
                // Si el contador auxiliar es 4, el contador principal sera igualado en 0
                // lo que quiere decir que no hay cartas en ese lugar
                if (contColum == 4)
                {
                    contador = 0;
                } 
            }// i
            // Si el contador principal es 5, el ciclo de j se rompe
            if (contador == 5)
            {
                break;
            }
        }// j

    }// if -1
    
    // _________________________________ JUGADA 7: Trio _____________________________________________
    // ______________________________________________________________________________________________
    // Las 3 cartas iguales y 2 de cualquier tipo

    if (numeroMejorJugada == -1)
    {
        ReiniciarMatrices(las7Cartas, manoJugador, CartasJugador, Mesa);
        contador = 0;
        int contAux = 0;
        contadorMayor = 0;
        bool trioT = false;

        // Recorre la matriz en descendente
        for (int j = 12; j >= 0; j--)
        {
            for (int i = 0; i < 4; i++)
            {
                // Si las7Cartas es true el contador principal aumenta
                if (las7Cartas[i][j] == true)
                {
                    contador++;
                }
                // Si el contador principal es igual a 3, el numero de la jugada sera 7 y se
                // activa el bool, luego se ingresan las cartas a la mano del jugador recorriendo solo las filas
                if (contador == 3)
                {
                    numeroMejorJugada = 7;
                    trioT = true;

                    for (int fila = 0; fila < 4; fila++)
                    {
                        if (las7Cartas[fila][j] == true)
                        {
                            manoJugador[fila][j] = true;
                            las7Cartas[fila][j] = false;
                        } 
                    } 
                }
            }// i
            // Al final el contador principal se iguala a 0 si no hay 3 cartas iguales
            contador = 0;
        }// j
        contAux = 0;

        // Si trio es true, entra al ciclo
        if (trioT == true)
        {
            // Recorre la matriz en forma descendente
            for (int j = 12; j >= 0; j--)
            {
                for (int i = 3; i >= 0; i--)
                {
                    // Si las7Cartas es true, la carta se movera a la mano del jugador
                    // y el contador auxiliar aumentara en 1
                    if (las7Cartas[i][j] == true)
                    {
                        manoJugador[i][j] = true;
                        contAux++;
                        contadorMayor++;

                        if (contadorMayor == 1)
                        {
                            desempate = j+2;
                        }
                        
                    }
                    // Si el contador auxiliar es mayor igual a 2, rompe el ciclo
                    if (contAux >= 2)
                    {
                        break;
                    }
                } // i
                // Si el contador auxiliar es mayor igual a 2, rompe el ciclo
                // (Tambien lo coloque aqui porque me seguia guardando cartas)
                if (contAux >= 2)
                    {
                        break;
                    }
            } // j*/
        }
    }
    
    // _______________________________ JUGADA 8: Doble Par __________________________________________
    // ______________________________________________________________________________________________
    // Dos pares, quinta carta mayor

    if (numeroMejorJugada == -1)
    {
        ReiniciarMatrices(las7Cartas, manoJugador, CartasJugador, Mesa);
        bool pareja1 = false;
        contador = 0;

        // ________________________ Bloque para la primer pareja ________________________
        // Recorre la matriz en orden decendente por sus columnas
        for (int j = 12; j >= 0; j--)
        {
            for (int i = 0; i < 4; i++)
            {
                // Si las7Cartas es true, el contador aumenta en 1
                if (las7Cartas[i][j] == true)
                {
                    contador++;
                }
                // Si el contador es igual a 2, pareja se activa y se ingresan dichas cartas a la mano del jugador
                if (contador == 2)
                {
                    pareja1 = true;

                    for (int fila = 0; fila < 4; fila++)
                    {
                        if (las7Cartas[fila][j] == true)
                        {
                            manoJugador[fila][j] = true;
                            las7Cartas[fila][j] = false;
                        }
                    }
                }
                if (contador == 2)
                {
                    break;
                }
            } // i
            if (contador == 2)
                {
                    break;
                }
            contador = 0;
        } // j

        // ________________________ Bloque para la segunda pareja ________________________
        // Se inicia una nueva variable
        bool pareja2 = false;

        if (pareja1 == true)
        {
            contador = 0;
            // Recorre la matriz en orden decendente por sus columnas
            for (int j = 12; j >= 0; j--)
            {
                for (int i = 0; i < 4; i++)
                {
                    // Si las7Cartas es true, el contador aumenta en 1
                    if (las7Cartas[i][j] == true)
                    {
                        contador++;
                    }
                    // Si el contador es igual a 2, pareja se activa y se ingresan dichas cartas a la mano del jugador
                    if (contador == 2)
                    {
                        pareja2 = true;

                        for (int fila = 0; fila < 4; fila++)
                        {
                            if (las7Cartas[fila][j] == true)
                            {
                                manoJugador[fila][j] = true;
                                las7Cartas[fila][j] = false;
                            }
                        }
                    }
                    if (contador == 2)
                    {
                        break;
                    }
                } // i
                if (contador == 2)
                {
                    break;
                }
                contador = 0;
            } // j
        }
        // ________________________ Bloque para la 5 carta ________________________
        bool quintaCarta = false;
        if (pareja2 == true)
        {
            int afirmar = 0;
            for (int j = 12; j >= 0; j--)
            {
                for (int i = 3; i >= 0; i--)
                {
                    if (las7Cartas[i][j] == true)
                    {
                        manoJugador[i][j] = true;
                        quintaCarta = true;
                        afirmar = 1;

                        if (afirmar == 1)
                        {
                            desempate = j+2;
                        }
                        
                        break;
                    }
                }// i
                if (afirmar == 1)
                {
                    break;
                }
            }// j
        }
        if (pareja1 == true && pareja2 == true && quintaCarta == true)
        {
            numeroMejorJugada = 8;
        }
    }// if -1
    
    // __________________________________ JUGADA 9: Par _____________________________________________
    // ______________________________________________________________________________________________
    // 1 par, tres cartas cualquera

    if (numeroMejorJugada == -1)
    {
        ReiniciarMatrices(las7Cartas, manoJugador, CartasJugador, Mesa);
        bool primerPareja = false;
        contador = 0;

        // ________________________ Bloque para la primer pareja ________________________
        // Recorre la matriz en orden decendente por sus columnas
        for (int j = 12; j >= 0; j--)
        {
            for (int i = 0; i < 4; i++)
            {
                // Si las7Cartas es true, el contador aumenta en 1
                if (las7Cartas[i][j] == true)
                {
                    contador++;
                }
                // Si el contador es igual a 2, pareja se activa y se ingresan dichas cartas a la mano del jugador
                if (contador == 2)
                {
                    primerPareja = true;

                    for (int fila = 0; fila < 4; fila++)
                    {
                        if (las7Cartas[fila][j] == true)
                        {
                            manoJugador[fila][j] = true;
                            las7Cartas[fila][j] = false;
                        }
                    }
                }
                if (contador == 2)
                {
                    break;
                }
            } // i
            if (contador == 2)
                {
                    break;
                }
            contador = 0;
        } // j

        // ________________________ Bloque para las 4 cartas restantes ________________________
        bool restantes = false;
        if (primerPareja == true)
        {
            contadorMayor = 0;
            int Cartas = 0;
            for (int j = 12; j >= 0; j--)
            {
                for (int i = 3; i >= 0; i--)
                {
                    if (las7Cartas[i][j] == true)
                    {
                        manoJugador[i][j] = true;
                        restantes = true;
                        Cartas++;
                        contadorMayor++;

                        if (contadorMayor == 1)
                        {
                            desempate = j+2;
                        }
                        
                        break;
                    }
                    if (Cartas == 3)
                    {
                        break;
                    }
                    
                }// i
                if (Cartas == 3)
                {
                    break;
                }
            }// j
        }
        if (primerPareja == true && restantes == true)
        {
            numeroMejorJugada = 9;
        }

    }// if -1
    
    // ______________________________ JUGADA 10: Carta alta _________________________________________
    // ______________________________________________________________________________________________
    // Cartas mayores

    if (numeroMejorJugada == -1)
    {
        ReiniciarMatrices(las7Cartas, manoJugador, CartasJugador, Mesa);
        contador = 0;
        contadorMayor = 0;

        for (int j = 12; j >= 0; j--)
        {
            for (int i = 3; i >= 0; i--)
            {
                if (las7Cartas[i][j] == true)
                {
                    manoJugador[i][j] = true;
                    contador++;
                    contadorMayor++;

                    if (contadorMayor == 1)
                    {
                        desempate = j+2;
                    }
                    

                    break;
                }
                if (contador == 5)
                {
                    numeroMejorJugada = 10;
                    break;
                }

            } // i
            if (contador == 5)
            {
                numeroMejorJugada = 10;
                break;
            }
        } // j
    }
  
} // Fin Funcion DeterminarMejorMano

// --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// _______________________________________________ FUNCION JUGAR POKER _______________________________________________ 
/*
    Recibe un vector con los nombres de los jugadores
    Recibe un entero que indica la cantidad de jugadores

    La funcion se encarga de definir las matrices y variables necesarias para ejecutar
    una partida completa de poker
*/

void JugarPoker(vector<string> jugadores, int cantidadJugadores, int ronda)
{
    /*
    Se trabaja con matrices de 4 filas por 4 columnas
    Las cartas tienen su valor de acuerdo a su COLUMNA, de menor a mayor:
    2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, As (indices del 0 al 12)

    Las FILAS representan cada PALO:
        Fila 0: Corazones ♥
        Fila 1: Diamantes ♦
        Fila 2: Treboles  ♣
        Fila 3: Espadas   ♠
    */

    bool MazoCartas[4][13];
    bool CartasJugador1[4][13];
    bool CartasJugador2[4][13];
    bool CartasJugador3[4][13];
    bool CartasJugador4[4][13];
    bool Mesa[4][13];

    // En las matrices CERO (false) significa que no esta la carta
    // UNO (true) significa que si esta la carta

    LlenarMatriz(MazoCartas, true);
    LlenarMatriz(CartasJugador1, false);
    LlenarMatriz(CartasJugador2, false);
    LlenarMatriz(CartasJugador3, false);
    LlenarMatriz(CartasJugador4, false);
    LlenarMatriz(Mesa, false);

    // Repartir 5 cartas a la mesa
    darUnaCarta(MazoCartas, Mesa);
    darUnaCarta(MazoCartas, Mesa);
    darUnaCarta(MazoCartas, Mesa);
    darUnaCarta(MazoCartas, Mesa);
    darUnaCarta(MazoCartas, Mesa);


    // Para obligar a una escalera real

    /*MazoCartas[0][8] = false;
    Mesa[0][8] = true;
    MazoCartas[0][9] = false;
    Mesa[0][9] = true;
    MazoCartas[0][10] = false;
    Mesa[0][10] = true;
    MazoCartas[0][11] = false;
    Mesa[0][11] = true;

    MazoCartas[2][4] = false;
    Mesa[2][4] = true; */


    // Repartir 2 cartas al jugador 1
    darUnaCarta(MazoCartas, CartasJugador1);
    darUnaCarta(MazoCartas, CartasJugador1);

    // Para obligar a una escalera real
/*    MazoCartas[0][12] = false;
    CartasJugador1[0][12] = true;
*/
    // Repartir 2 cartas al jugador 2
    darUnaCarta(MazoCartas, CartasJugador2);
    darUnaCarta(MazoCartas, CartasJugador2);

    // Repartir 2 cartas al jugador 3 si la cantidad de jugadores es igual o mayor a 3
    if (cantidadJugadores >= 3)
    {
        darUnaCarta(MazoCartas, CartasJugador3);
        darUnaCarta(MazoCartas, CartasJugador3);
    }
    // Repartir 2 cartas al jugador 3 si la cantidad de jugadores es igual a 4
    if (cantidadJugadores == 4)
    {
        darUnaCarta(MazoCartas, CartasJugador4);
        darUnaCarta(MazoCartas, CartasJugador4);
    }

    system("cls");
    // Titulo y partida actual
    cout << endl << "========================== |   POKER   | ==========================" << endl << "\t\t\t  | Partida : " << ronda << " |" << endl << endl << "Manos:";

    // Mano del Jugador 1
    cout << endl << setw(15) << jugadores[0] << ":" << setw(5) << "|";
    MostrarCartas(CartasJugador1, false);
    
    // Mano del Jugador 2
    cout << endl << setw(15) << jugadores[1] << ":" << setw(5) << "|";
    MostrarCartas(CartasJugador2, false);

    // Mano del Jugador 3
    if (cantidadJugadores >= 3)
    {
        cout << endl << setw(15) << jugadores[2] << ":" << setw(5) << "|";
        MostrarCartas(CartasJugador3, false);
    }

    // Mano del Jugador 4
    if (cantidadJugadores == 4)
    {
        cout << endl << setw(15) << jugadores[3] << ":" << setw(5) << "|";
        MostrarCartas(CartasJugador4, false);
    }

    // Mostrar cartas de la mesa
    cout << endl;
    cout << endl << "\t____________________________________________________" << endl << endl;
    cout << setw(20) << "Mesa" << ":" << setw(5) << "|";
    MostrarCartas(Mesa, false);
    cout << endl << "\t____________________________________________________" << endl << endl << endl;

    // Jugadas de cada jugador con las cartas de la mesa
    cout << setw(48) << "*** | JUGADAS | ***" << endl << endl << endl;
    
    // Crear una matriz que contenga las 5 cartas que elegira el jugador(a)
    // De las 5 cartas de la mesa y las 2 del jugador, de esas 7 elije 5 que forme una jugada
    bool J1_mano[4][13];
    bool J2_mano[4][13];
    bool J3_mano[4][13];
    bool J4_mano[4][13];

    // Se llenan las matrices de las manos con espacios vacios
    LlenarMatriz(J1_mano, false);
    LlenarMatriz(J2_mano, false);
    LlenarMatriz(J3_mano, false);
    LlenarMatriz(J4_mano, false);

    // Variables para la jugada retornada de cada jugador y su jugada mayor para el desempate
    int J1_numeroMejorJugada = 0, J2_numeroMejorJugada = 0, J3_numeroMejorJugada = 0, J4_numeroMejorJugada = 0;
    int mayorJ1 = 0, mayorJ2 = 0, mayorJ3 = 0, mayorJ4 = 0;
    string mano = "";

    // -------------------- Jugada del jugador 1 --------------------
    
    // Se llama la funcion para determinar la jugada del jugador
    DeterminarMejorMano(CartasJugador1, Mesa, J1_mano, J1_numeroMejorJugada, mayorJ1);

    // Despues de obtener la jugada, se llama una funcion que lleva dicha variable
    mano = NombreMano(J1_numeroMejorJugada);

    // Se muestra el nombre del jugador
    cout << setw(15) << jugadores[0] << ":\t|";

    // Se muestran sus cartas
    MostrarCartasMayor(J1_mano, false);

    // Se muestra el numero de jugada y el nombre de esta
    cout << setw(13) << "-< Mano " << J1_numeroMejorJugada << mano << endl << setw(17) << "------------" << endl << endl;

    // -------------------- Jugador 2 --------------------

    // Se llama la funcion para determinar la jugada del jugador
    DeterminarMejorMano(CartasJugador2, Mesa, J2_mano, J2_numeroMejorJugada, mayorJ2);

    // Despues de obtener la jugada, se llama una funcion que lleva dicha variable
    mano = NombreMano(J2_numeroMejorJugada);

    // Se muestra el nombre del jugador
    cout << setw(15) << jugadores[1] << ":\t|";

    // Se muestran sus cartas
    MostrarCartasMayor(J2_mano, false);

    // Se muestra el numero de jugada y el nombre de esta
    cout << setw(13) << "-< Mano " << J2_numeroMejorJugada << mano << endl << setw(17) << "------------" << endl << endl;

    // -------------------- Jugador 3 --------------------
    if (cantidadJugadores >= 3)
    {
        // Se llama la funcion para determinar la jugada del jugador
        DeterminarMejorMano(CartasJugador3, Mesa, J3_mano, J3_numeroMejorJugada, mayorJ3);

        // Despues de obtener la jugada, se llama una funcion que lleva dicha variable
        mano = NombreMano(J3_numeroMejorJugada);

        // Se muestra el nombre del jugador
        cout << setw(15) << jugadores[2] << ":\t|";

        // Se muestran sus cartas
        MostrarCartasMayor(J3_mano, false);

        // Se muestra el numero de jugada y el nombre de esta
        cout << setw(13) << "-< Mano " << J3_numeroMejorJugada << mano << endl << setw(17) << "------------" << endl << endl;
    }

    // -------------------- Jugador 2 --------------------
    if (cantidadJugadores >= 4)
    {
        // Se llama la funcion para determinar la jugada del jugador
        DeterminarMejorMano(CartasJugador4, Mesa, J4_mano, J4_numeroMejorJugada, mayorJ4);

        // Despues de obtener la jugada, se llama una funcion que lleva dicha variable
        mano = NombreMano(J4_numeroMejorJugada);

        // Se muestra el nombre del jugador
        cout << setw(15) << jugadores[3] << ":\t|";
        
        // Se muestran sus cartas
        MostrarCartasMayor(J4_mano, false);
        
        // Se muestra el numero de jugada y el nombre de esta
        cout << setw(13) << "-< Mano " << J4_numeroMejorJugada << mano << endl << setw(17) << "------------" << endl << endl;
    }

    // Se llama la funcion para determinar un ganador
    Ganador(jugadores, cantidadJugadores, J1_numeroMejorJugada, mayorJ1, J2_numeroMejorJugada, mayorJ2, J3_numeroMejorJugada, mayorJ3, J4_numeroMejorJugada, mayorJ4);

} // FIN FUNCION JUGAR POKER