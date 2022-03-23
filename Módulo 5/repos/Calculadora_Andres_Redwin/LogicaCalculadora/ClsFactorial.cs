using System;

namespace LogicaCalculadora
{
    public class ClsFactorial
    {
        public double calcularFactorial(double factorial)
        {
            double facto = factorial;
            int largo = Convert.ToInt32(facto - 1);

            for (int i = largo; i > 0; i--)
            {
                facto *= i;
            }

            return facto;
        }
    }
}
