
namespace AmigoSecreto
{
    partial class frmAmigazazo
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmAmigazazo));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnEliminarElemento = new System.Windows.Forms.Button();
            this.btnEliminarTodo = new System.Windows.Forms.Button();
            this.btnEliminar2 = new System.Windows.Forms.Button();
            this.btnEliminar1 = new System.Windows.Forms.Button();
            this.btnMix = new System.Windows.Forms.Button();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtNombres = new System.Windows.Forms.TextBox();
            this.lstParejas = new System.Windows.Forms.ListBox();
            this.lstAgregados = new System.Windows.Forms.ListBox();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.SeaGreen;
            this.groupBox1.Controls.Add(this.btnEliminarElemento);
            this.groupBox1.Controls.Add(this.btnEliminarTodo);
            this.groupBox1.Controls.Add(this.btnEliminar2);
            this.groupBox1.Controls.Add(this.btnEliminar1);
            this.groupBox1.Controls.Add(this.btnMix);
            this.groupBox1.Controls.Add(this.btnAgregar);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtNombres);
            this.groupBox1.Controls.Add(this.lstParejas);
            this.groupBox1.Controls.Add(this.lstAgregados);
            this.groupBox1.ForeColor = System.Drawing.Color.Aqua;
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(569, 532);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Amigo amigo amigo";
            // 
            // btnEliminarElemento
            // 
            this.btnEliminarElemento.BackColor = System.Drawing.Color.Peru;
            this.btnEliminarElemento.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnEliminarElemento.ForeColor = System.Drawing.SystemColors.Info;
            this.btnEliminarElemento.Location = new System.Drawing.Point(142, 96);
            this.btnEliminarElemento.Name = "btnEliminarElemento";
            this.btnEliminarElemento.Size = new System.Drawing.Size(88, 52);
            this.btnEliminarElemento.TabIndex = 9;
            this.btnEliminarElemento.Text = "Eliminar Elemento";
            this.btnEliminarElemento.UseVisualStyleBackColor = false;
            this.btnEliminarElemento.Click += new System.EventHandler(this.btnEliminarElemento_Click);
            // 
            // btnEliminarTodo
            // 
            this.btnEliminarTodo.BackColor = System.Drawing.SystemColors.Desktop;
            this.btnEliminarTodo.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnEliminarTodo.ForeColor = System.Drawing.SystemColors.Control;
            this.btnEliminarTodo.Location = new System.Drawing.Point(341, 96);
            this.btnEliminarTodo.Name = "btnEliminarTodo";
            this.btnEliminarTodo.Size = new System.Drawing.Size(88, 52);
            this.btnEliminarTodo.TabIndex = 8;
            this.btnEliminarTodo.Text = "Eliminar todo";
            this.btnEliminarTodo.UseVisualStyleBackColor = false;
            this.btnEliminarTodo.Click += new System.EventHandler(this.btnEliminarTodo_Click);
            // 
            // btnEliminar2
            // 
            this.btnEliminar2.BackColor = System.Drawing.Color.Tomato;
            this.btnEliminar2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnEliminar2.ForeColor = System.Drawing.SystemColors.Info;
            this.btnEliminar2.Location = new System.Drawing.Point(452, 96);
            this.btnEliminar2.Name = "btnEliminar2";
            this.btnEliminar2.Size = new System.Drawing.Size(88, 52);
            this.btnEliminar2.TabIndex = 7;
            this.btnEliminar2.Text = "Limpiar Lista";
            this.btnEliminar2.UseVisualStyleBackColor = false;
            this.btnEliminar2.Click += new System.EventHandler(this.btnEliminar2_Click);
            // 
            // btnEliminar1
            // 
            this.btnEliminar1.BackColor = System.Drawing.Color.Tomato;
            this.btnEliminar1.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnEliminar1.ForeColor = System.Drawing.SystemColors.Info;
            this.btnEliminar1.Location = new System.Drawing.Point(31, 96);
            this.btnEliminar1.Name = "btnEliminar1";
            this.btnEliminar1.Size = new System.Drawing.Size(88, 52);
            this.btnEliminar1.TabIndex = 6;
            this.btnEliminar1.Text = "Limpiar Lista";
            this.btnEliminar1.UseVisualStyleBackColor = false;
            this.btnEliminar1.Click += new System.EventHandler(this.btnEliminar_Click);
            // 
            // btnMix
            // 
            this.btnMix.BackColor = System.Drawing.SystemColors.MenuBar;
            this.btnMix.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnMix.ForeColor = System.Drawing.SystemColors.Highlight;
            this.btnMix.Location = new System.Drawing.Point(247, 304);
            this.btnMix.Name = "btnMix";
            this.btnMix.Size = new System.Drawing.Size(75, 30);
            this.btnMix.TabIndex = 5;
            this.btnMix.Text = "Mix";
            this.btnMix.UseVisualStyleBackColor = false;
            this.btnMix.Click += new System.EventHandler(this.btnMix_Click);
            // 
            // btnAgregar
            // 
            this.btnAgregar.BackColor = System.Drawing.Color.Black;
            this.btnAgregar.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnAgregar.ForeColor = System.Drawing.Color.Yellow;
            this.btnAgregar.Location = new System.Drawing.Point(476, 36);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(75, 30);
            this.btnAgregar.TabIndex = 4;
            this.btnAgregar.Text = "Agregar";
            this.btnAgregar.UseVisualStyleBackColor = false;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.LavenderBlush;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.ForeColor = System.Drawing.SystemColors.MenuHighlight;
            this.label1.Location = new System.Drawing.Point(6, 38);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(176, 25);
            this.label1.TabIndex = 3;
            this.label1.Text = "Agregar amigazazo";
            // 
            // txtNombres
            // 
            this.txtNombres.Font = new System.Drawing.Font("Segoe UI", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.txtNombres.Location = new System.Drawing.Point(202, 33);
            this.txtNombres.Name = "txtNombres";
            this.txtNombres.Size = new System.Drawing.Size(258, 33);
            this.txtNombres.TabIndex = 2;
            this.txtNombres.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.txtNombres.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtNombres_KeyDown);
            // 
            // lstParejas
            // 
            this.lstParejas.BackColor = System.Drawing.Color.PaleTurquoise;
            this.lstParejas.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lstParejas.FormattingEnabled = true;
            this.lstParejas.ItemHeight = 20;
            this.lstParejas.Location = new System.Drawing.Point(341, 162);
            this.lstParejas.Name = "lstParejas";
            this.lstParejas.Size = new System.Drawing.Size(199, 364);
            this.lstParejas.TabIndex = 1;
            // 
            // lstAgregados
            // 
            this.lstAgregados.BackColor = System.Drawing.Color.PaleTurquoise;
            this.lstAgregados.Font = new System.Drawing.Font("Segoe UI", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.lstAgregados.FormattingEnabled = true;
            this.lstAgregados.ItemHeight = 20;
            this.lstAgregados.Location = new System.Drawing.Point(31, 162);
            this.lstAgregados.Name = "lstAgregados";
            this.lstAgregados.Size = new System.Drawing.Size(199, 364);
            this.lstAgregados.TabIndex = 0;
            // 
            // frmAmigazazo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.MediumSeaGreen;
            this.ClientSize = new System.Drawing.Size(593, 556);
            this.Controls.Add(this.groupBox1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmAmigazazo";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Secretar amigos";
            this.Load += new System.EventHandler(this.frmAmigazazo_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ListBox lstParejas;
        private System.Windows.Forms.ListBox lstAgregados;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtNombres;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.Button btnMix;
        private System.Windows.Forms.Button btnEliminar1;
        private System.Windows.Forms.Button btnEliminar2;
        private System.Windows.Forms.Button btnEliminarTodo;
        private System.Windows.Forms.Button btnEliminarElemento;
    }
}

