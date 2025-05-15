namespace criptare
{
    partial class Form1
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
            label1 = new Label();
            btnSI = new Button();
            btnSU = new Button();
            label2 = new Label();
            textBox1 = new TextBox();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(35, 27);
            label1.Name = "label1";
            label1.Size = new Size(157, 25);
            label1.TabIndex = 0;
            label1.Text = "CRIPTARE MESAJE";
            // 
            // btnSI
            // 
            btnSI.Location = new Point(46, 187);
            btnSI.Name = "btnSI";
            btnSI.Size = new Size(381, 354);
            btnSI.TabIndex = 1;
            btnSI.Text = "Autentifica-te";
            btnSI.UseVisualStyleBackColor = true;
            // 
            // btnSU
            // 
            btnSU.Location = new Point(492, 187);
            btnSU.Name = "btnSU";
            btnSU.Size = new Size(382, 354);
            btnSU.TabIndex = 2;
            btnSU.Text = "Creeaza cont";
            btnSU.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(194, 99);
            label2.Name = "label2";
            label2.Size = new Size(95, 25);
            label2.TabIndex = 3;
            label2.Text = "Username:";
            // 
            // textBox1
            // 
            textBox1.Location = new Point(326, 95);
            textBox1.Name = "textBox1";
            textBox1.Size = new Size(530, 31);
            textBox1.TabIndex = 4;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1277, 722);
            Controls.Add(textBox1);
            Controls.Add(label2);
            Controls.Add(btnSU);
            Controls.Add(btnSI);
            Controls.Add(label1);
            Name = "Form1";
            Text = "Form1";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Button btnSI;
        private Button btnSU;
        private Label label2;
        private TextBox textBox1;
    }
}
