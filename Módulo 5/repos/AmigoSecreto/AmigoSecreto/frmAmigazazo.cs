using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AmigoSecreto
{
    public partial class frmAmigazazo : Form
    {
        public frmAmigazazo()
        {
            InitializeComponent();
        }

        private void frmAmigazazo_Load(object sender, EventArgs e)
        {
            txtNombres.Select();
        }


        // btnAgregar_Click
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            AgregarALista();
        }

        // txtNombres_KeyDown
        private void txtNombres_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                AgregarALista();
            }
        }


        // btnEliminar_Click
        private void btnEliminar_Click(object sender, EventArgs e)
        {
            lstAgregados.Items.Clear();
            txtNombres.Clear();
        }


        // btnEliminar2_Click
        private void btnEliminar2_Click(object sender, EventArgs e)
        {
            lstParejas.Items.Clear();
            txtNombres.Clear();
        }


        // btnEliminarTodo_Click
        private void btnEliminarTodo_Click(object sender, EventArgs e)
        {
            lstAgregados.Items.Clear();
            lstParejas.Items.Clear();
            txtNombres.Clear();
        }


        // btnMix_Click
        private void btnMix_Click(object sender, EventArgs e)
        {
            Random nR = new Random();
            //int largo = lstAgregados.Items.Count;
            int random = nR.Next(0, lstAgregados.Items.Count);


            List<string> miLista = new List<string>();

            for (int i = 0; i < lstAgregados.Items.Count; i++)
            {
                miLista.Add(lstAgregados.Items[i].ToString());
            }

            string[] arrayLista = miLista.ToArray();

            
            // ESTOY HASTA LA PUTA MADRE
            for (int i = 0; i < arrayLista.Length; i++)
            {
                random = nR.Next(0, lstAgregados.Items.Count);

                while (arrayLista[random] == "ñ+")
                {
                    random = nR.Next(0, lstAgregados.Items.Count);
                }

                lstParejas.Items.Add(arrayLista[random]);
                arrayLista[random] = "ñ+";
            }

            MessageBox.Show("En la columna de la derecha se van a mostrar los participantes mezclados, de forma que el ultimo tendra que darle el regalo al primero para asi finalizar con la actividad");
            
        }

        // btnEliminarElemento_Click
        private void btnEliminarElemento_Click(object sender, EventArgs e)
        {
            if (lstAgregados.SelectedItem == null)
            {
                return;
            }
            else
            {
                lstAgregados.Items.RemoveAt(lstAgregados.SelectedIndex);
            }
        }



        // Métodos
        public void AgregarALista()
        {
            if (!string.IsNullOrEmpty(txtNombres.Text))
            {
                lstAgregados.Items.Add(txtNombres.Text);
                txtNombres.Clear();
                txtNombres.Focus();
            }
        }


    }
}
