using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using LogicaCalculadora;
using LogicaCalculadora2;

namespace Calculadora_Andres_Redwin
{
    public partial class frmCALCULADORA : Form
    {

        // Variables
        bool textoNumero = true;
        string operador = "";
        double num1 = 0.0, num2 = 0.0, total = 0.0;
        bool comas = true;

        public frmCALCULADORA()
        {
            InitializeComponent();
        }

        // frmCALCULADORA_Load
        private void frmCALCULADORA_Load(object sender, EventArgs e)
        {
            // Al iniciar el formulario se selecciona ese cuadro de texto
            txtProcedimiento.Select();
        }

        // _____________________________________________ BOTONES NÚMEROS _____________________________________________

        // btn1_Click
        private void btn1_Click(object sender, EventArgs e)
        {
            if (textoNumero)
            {
                // se hizo esto de esta manera porque si se ingresaban números desde el teclado y luego de los botones, se borraba sin sentido
                if (txtProcedimiento.Text != "")
                {
                    txtProcedimiento.Text += "1";
                    textoNumero = false;
                }
                else
                {
                    txtProcedimiento.Text = "";
                    txtProcedimiento.Text = "1";
                    textoNumero = false;
                }
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "1";
            }
        }

        // btn2_Click
        private void btn2_Click(object sender, EventArgs e)
        {
            if (textoNumero)
            {
                // se hizo esto de esta manera porque si se ingresaban números desde el teclado y luego de los botones, se borraba sin sentido
                if (txtProcedimiento.Text != "")
                {
                    txtProcedimiento.Text += "2";
                    textoNumero = false;
                }
                else
                {
                    txtProcedimiento.Text = "";
                    txtProcedimiento.Text = "2";
                    textoNumero = false;
                }
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "2";
            }
        }

        // btn3_Click
        private void btn3_Click(object sender, EventArgs e)
        {
            if (textoNumero)
            {
                // se hizo esto de esta manera porque si se ingresaban números desde el teclado y luego de los botones, se borraba sin sentido
                if (txtProcedimiento.Text != "")
                {
                    txtProcedimiento.Text += "3";
                    textoNumero = false;
                }
                else
                {
                    txtProcedimiento.Text = "";
                    txtProcedimiento.Text = "3";
                    textoNumero = false;
                }
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "3";
            }
        }

        // btn4_Click
        private void btn4_Click(object sender, EventArgs e)
        {
            if (textoNumero)
            {
                // se hizo esto de esta manera porque si se ingresaban números desde el teclado y luego de los botones, se borraba sin sentido
                if (txtProcedimiento.Text != "")
                {
                    txtProcedimiento.Text += "4";
                    textoNumero = false;
                }
                else
                {
                    txtProcedimiento.Text = "";
                    txtProcedimiento.Text = "4";
                    textoNumero = false;
                }
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "4";
            }
        }

        // btn5_Click
        private void btn5_Click(object sender, EventArgs e)
        {
            if (textoNumero)
            {
                // se hizo esto de esta manera porque si se ingresaban números desde el teclado y luego de los botones, se borraba sin sentido
                if (txtProcedimiento.Text != "")
                {
                    txtProcedimiento.Text += "5";
                    textoNumero = false;
                }
                else
                {
                    txtProcedimiento.Text = "";
                    txtProcedimiento.Text = "5";
                    textoNumero = false;
                }
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "5";
            }
        }

        // btn6_Click
        private void btn6_Click(object sender, EventArgs e)
        {
            if (textoNumero)
            {
                // se hizo esto de esta manera porque si se ingresaban números desde el teclado y luego de los botones, se borraba sin sentido
                if (txtProcedimiento.Text != "")
                {
                    txtProcedimiento.Text += "6";
                    textoNumero = false;
                }
                else
                {
                    txtProcedimiento.Text = "";
                    txtProcedimiento.Text = "6";
                    textoNumero = false;
                }
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "6";
            }
        }

        // btn7_Click
        private void btn7_Click(object sender, EventArgs e)
        {
            if (textoNumero)
            {
                // se hizo esto de esta manera porque si se ingresaban números desde el teclado y luego de los botones, se borraba sin sentido
                if (txtProcedimiento.Text != "")
                {
                    txtProcedimiento.Text += "7";
                    textoNumero = false;
                }
                else
                {
                    txtProcedimiento.Text = "";
                    txtProcedimiento.Text = "7";
                    textoNumero = false;
                }
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "7";
            }
        }

        // btn8_Click
        private void btn8_Click(object sender, EventArgs e)
        {
            if (textoNumero)
            {
                // se hizo esto de esta manera porque si se ingresaban números desde el teclado y luego de los botones, se borraba sin sentido
                if (txtProcedimiento.Text != "")
                {
                    txtProcedimiento.Text += "8";
                    textoNumero = false;
                }
                else
                {
                    txtProcedimiento.Text = "";
                    txtProcedimiento.Text = "8";
                    textoNumero = false;
                }
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "8";
            }
        }

        // btn9_Click
        private void btn9_Click(object sender, EventArgs e)
        {
            if (textoNumero)
            {
                // se hizo esto de esta manera porque si se ingresaban números desde el teclado y luego de los botones, se borraba sin sentido
                if (txtProcedimiento.Text != "")
                {
                    txtProcedimiento.Text += "9";
                    textoNumero = false;
                }
                else
                {
                    txtProcedimiento.Text = "";
                    txtProcedimiento.Text = "9";
                    textoNumero = false;
                }
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "9";
            }
        }

        // btn0_Click
        private void btn0_Click(object sender, EventArgs e)
        {
            if (txtProcedimiento.Text == "0")
            {
                return;
            }
            else if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else
            {
                txtProcedimiento.Text += "0";
                textoNumero = false;
            }
        }

        // btnComa_Click
        private void btnComa_Click(object sender, EventArgs e)
        {
            if (txtProcedimiento.Text.Length >= 16)
            {
                return;
            }
            else if (textoNumero)
            {
                txtProcedimiento.Text = "";
                txtProcedimiento.Text = "0,";
                textoNumero = false;
                comas = false;
            }
            //if (txtProcedimiento.Text == "")
            //{
            //    txtProcedimiento.Text = "0,";
            //    comas = false;
            //}
            else
            {
                if (comas == true)
                {
                    txtProcedimiento.Text += ",";
                    comas = false;
                }
            }
        }

        // _____________________________________________ BOTONES DEMÁS _____________________________________________


        // btnSumar_Click
        private void btnSumar_Click(object sender, EventArgs e)
        {
            //Entra cuando se quiere usar el resultado para seguir sumando
            if (txtResultado.Text != "0" & txtProcedimiento.Text == "")
            {
                txtProcedimiento.Text = txtResultado.Text;
                txtResultado.Text = "";
            }

            operador = "+";
            txtSignos.Text = "+";
            textoNumero = true;
            comas = true;

            // Sino tiene nada ingresado no sucede nada, solo se suma 0
            if ((txtResultado.Text == "0" || txtResultado.Text == "") & txtProcedimiento.Text == "")
            {
                num1 = 0;
                txtProcedimiento.Text = "0";
            }
            else
            {
                num1 = Convert.ToDouble(txtProcedimiento.Text);
                txtProcedimiento.Clear();
            }
            txtNum1.Text = Convert.ToString(num1);
            txtProcedimiento.Select();
        }

        // btnRestar_Click
        private void btnRestar_Click(object sender, EventArgs e)
        {
            if (txtResultado.Text != "0" & txtProcedimiento.Text == "")
            {
                txtProcedimiento.Text = txtResultado.Text;
                txtResultado.Text = "";
            }

            operador = "-";
            txtSignos.Text = "-";
            textoNumero = true;
            comas = true;

            if ((txtResultado.Text == "0" || txtResultado.Text == "") & txtProcedimiento.Text == "")
            {
                num1 = 0;
                txtProcedimiento.Text = "0";
            }
            else
            {
                num1 = Convert.ToDouble(txtProcedimiento.Text);
                txtProcedimiento.Clear();
            }
            txtNum1.Text = Convert.ToString(num1);
            txtProcedimiento.Select();
        }

        // btnMultiplicar_Click
        private void btnMultiplicar_Click(object sender, EventArgs e)
        {
            if (txtResultado.Text != "0" & txtProcedimiento.Text == "")
            {
                txtProcedimiento.Text = txtResultado.Text;
                txtResultado.Text = "";
            }

            operador = "*";
            txtSignos.Text = "*";
            textoNumero = true;
            comas = true;

            if ((txtResultado.Text == "0" || txtResultado.Text == "") & txtProcedimiento.Text == "")
            {
                num1 = 0;
                txtProcedimiento.Text = "0";
            }
            else
            {
                num1 = Convert.ToDouble(txtProcedimiento.Text);
                txtProcedimiento.Clear();
            }
            txtNum1.Text = Convert.ToString(num1);
            txtProcedimiento.Select();
        }

        // btnDividir_Click
        private void btnDividir_Click(object sender, EventArgs e)
        {
            if (txtResultado.Text != "0" & txtProcedimiento.Text == "")
            {
                txtProcedimiento.Text = txtResultado.Text;
                txtResultado.Text = "";
            }

            operador = "/";
            txtSignos.Text = "/";
            textoNumero = true;
            comas = true;

            if ((txtResultado.Text == "0" || txtResultado.Text == "") & txtProcedimiento.Text == "")
            {
                num1 = 0;
                txtProcedimiento.Text = "0";
            }
            else
            {
                num1 = Convert.ToDouble(txtProcedimiento.Text);
                txtProcedimiento.Clear();
            }
            txtNum1.Text = Convert.ToString(num1);
            txtProcedimiento.Select();
        }

        // btnBorrar_Click
        private void btnBorrar_Click(object sender, EventArgs e)
        {
            if (txtProcedimiento.Text == "")
            {
                return;
            }
            else
            {
                if (txtProcedimiento.Text.EndsWith(","))
                {
                    comas = true;
                    txtProcedimiento.Text = txtProcedimiento.Text.Substring(0, txtProcedimiento.Text.Count() - 1);
                }
                else
                {
                    txtProcedimiento.Text = txtProcedimiento.Text.Substring(0, txtProcedimiento.Text.Count() - 1);
                }
            }
            //txtProcedimiento.Focus();
        }

        // btnFactorial_Click
        private void btnFactorial_Click(object sender, EventArgs e)
        {
            // Usar la capa lógica
            ClsFactorial numFactorial = new ClsFactorial();
            double ingresadoFacto = 0.0;

            if (txtProcedimiento.Text == "")
            {
                txtProcedimiento.Text = "0";
            }
            if (Convert.ToDouble(txtProcedimiento.Text) >= 100)
            {
                MessageBox.Show("WTF amiko, estás reloco");
            }
            else if (Convert.ToDouble(txtProcedimiento.Text) <= 0.9 | txtProcedimiento.Text == "")
            {
                MessageBox.Show($"Cannot input \"{txtProcedimiento.Text}\". Please try again");
                txtProcedimiento.Clear();
                txtSignos.Clear();
                txtResultado.Clear();
                txtNum1.Clear();
            }
            else
            {
                ingresadoFacto = Convert.ToDouble(txtProcedimiento.Text);
                txtResultado.Text = Convert.ToString(numFactorial.calcularFactorial(ingresadoFacto));
                txtSignos.Text = "x!";
            }
            txtProcedimiento.Focus();
        }

        // btnFibonacci_Click
        private void btnFibonacci_Click(object sender, EventArgs e)
        {
            ClsFyvOnaschy figoracho = new ClsFyvOnaschy();
            int ingresadoFigo = 0;

            if (txtProcedimiento.Text == "")
            {
                txtProcedimiento.Text = "0";
            }

            if (Convert.ToDouble(txtProcedimiento.Text) >= 99999999)
            {
                MessageBox.Show("nope");
            }
            else if (Convert.ToDouble(txtProcedimiento.Text) <= 0.9 | txtProcedimiento.Text == "" | txtProcedimiento.Text == "0")
            {
                MessageBox.Show($"Cannot input \"{txtProcedimiento.Text}\". Please try again");
                txtProcedimiento.Clear();
                txtSignos.Clear();
                txtResultado.Clear();
                txtNum1.Clear();
            }
            else
            {
                ingresadoFigo = Convert.ToInt32(txtProcedimiento.Text);
                txtResultado.Text = Convert.ToString(figoracho.calcularFibonacci(ingresadoFigo));
                txtSignos.Text = "F";
            }
            txtProcedimiento.Select();
        }

        // btnLimpiar_Click
        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtProcedimiento.Clear();
            txtSignos.Clear();
            txtResultado.Clear();
            txtNum1.Clear();
            comas = true;
            txtProcedimiento.Focus();
        }

        // btnIgual_Click
        private void btnIgual_Click(object sender, EventArgs e)
        {
            // Si no tiene el procedimiento se establece que el segundo número es 0
            if (txtProcedimiento.Text == "")
            {
                num2 = 0;
            }
            else
            {
                num2 = Convert.ToDouble(txtProcedimiento.Text);
                txtProcedimiento.Clear();
            }

            textoNumero = true;

            //Dependiendo del operador seleccionado
            switch (operador)
            {
                case "+":
                    total = num1 + num2;
                    txtNum1.Text += " + " + Convert.ToString(num2);
                    txtResultado.Text = "= " + total.ToString();
                    txtSignos.Text = "";
                    txtProcedimiento.Focus();
                    break;

                case "-":
                    total = num1 - num2;
                    txtNum1.Text += " - " + Convert.ToString(num2);
                    txtResultado.Text = "= " + total.ToString();
                    txtSignos.Text = "";
                    break;

                case "/":

                    if (num2 == 0)
                    {
                        // Si el número se divide entre 0, el prosedimiento será num1 y el signo será /
                        txtProcedimiento.Text = Convert.ToString(num1);
                        txtSignos.Text = "/";
                        txtResultado.Clear();
                        MessageBox.Show("Cannot divide by 0");
                    }
                    else
                    {
                        total = num1 / num2;
                        txtNum1.Text += " / " + Convert.ToString(num2);
                        txtResultado.Text = "= " + total.ToString();
                        txtSignos.Text = "";
                    }

                    break;


                case "*":
                    total = num1 * num2;
                    txtNum1.Text += " * " + Convert.ToString(num2);
                    txtResultado.Text = "= " + total.ToString();
                    txtSignos.Text = "";
                    break;
            }
        }

        //  txtProcedimiento_TextChanged
        private void txtProcedimiento_TextChanged(object sender, EventArgs e)
        {

        }


        // txtProcedimiento_KeyPress
        private void txtProcedimiento_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 45 & txtProcedimiento.Text == "")
            {
                e.Handled = false;
            }
            else if ((e.KeyChar >= 32 & e.KeyChar <= 47) | (e.KeyChar >= 58 & e.KeyChar <= 255))
            {
                e.Handled = true;
                return;
            }
        }


        // _____________________________________________ PROCEDIMIENTO DE TECLA _____________________________________________
        // Métodos

    }
}
