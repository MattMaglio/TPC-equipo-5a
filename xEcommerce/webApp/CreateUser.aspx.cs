using ApplicationService;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webApp
{
    public partial class CreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                //valores iniciales vacíos
                txtUser.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtConfirmoPassword.Text = string.Empty;
            }
        }

        protected void btnCancelRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            bool isValid = true;

            // Validar User
            if (string.IsNullOrWhiteSpace(txtUser.Text))
            {
                lblPasswordError.Text = "Se requiere un nombre de usuario";
                isValid = false;
            }


            // Validar Contraseña
            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblPasswordError.Text = "Se requiere una contraseña";
                isValid = false;
            }
            else if (txtPassword.Text.Length < 6)  // mínimo 6 caracteres
            {
                lblPasswordError.Text = "La contraseña debe tener al menos 6 caracteres, contener al menos un número, una letra mayúscula y al menos una letra minúscula";
                isValid = false;
            }
            else if (!txtPassword.Text.Any(char.IsDigit))  // al menos un número
            {
                lblPasswordError.Text = "La contraseña debe tener al menos 6 caracteres, contener al menos un número, una letra mayúscula y al menos una letra minúscula";
                isValid = false;
            }
            else if (!txtPassword.Text.Any(char.IsUpper))  // al menos una letra mayúscula
            {
                lblPasswordError.Text = "La contraseña debe tener al menos 6 caracteres, contener al menos un número, una letra mayúscula y al menos una letra minúscula";
                isValid = false;
            }
            else if (!txtPassword.Text.Any(char.IsLower))  // al menos una letra minúscula
            {
                lblPasswordError.Text = "La contraseña debe tener al menos 6 caracteres, contener al menos un número, una letra mayúscula y al menos una letra minúscula";
                isValid = false;
            }

            // Validar que la contraseña repetida coincida
            if (txtPassword.Text != txtConfirmoPassword.Text)
            {
                lblConfirmoPasswordError.Text = "Las contraseñas no coinciden";
                isValid = false;
            }

            //si los datos son válidos hago el ingreso
            if (isValid)
            {
                try
                {
                    Usuario usuario = new Usuario();
                    UsuarioAS usuarioAS = new UsuarioAS();

                    usuario.User = txtUser.Text;
                    usuario.Pass = txtConfirmoPassword.Text;

                    usuarioAS.insertUsuario(usuario);

                    // Mostrar mensaje de éxito
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "showSuccessMessage();", true);
                }
                catch (Exception ex)
                {
                    // Manejo de excepciones
                    Console.WriteLine("Error during registration: btnCreateAccount " + ex.Message);
                    throw;
                }
               
            }

        }
    }
}