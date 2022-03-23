using System;

namespace LogicaCalculadora2
{
    public class ClsFyvOnaschy
    {
        // calcularFibonacci
        public int calcularFibonacci(int fibo)
        {
            int numA = 0, numB = 1, auxiliar = 0;

            for (int i = 0; i < fibo; i++)
            {
                auxiliar = numA;
                numA = numB;
                numB = auxiliar + numA;
            }

            return numA;
        }
    }
}
