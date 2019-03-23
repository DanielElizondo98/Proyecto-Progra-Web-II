using Contexto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    public class UsuarioLN
    {
        public static IQueryable QueryListaUsuario()
        {
            var db = new BD_EcomonedasContext();
            IQueryable query = db.Usuario;
            return query;
        }
        public static IEnumerable<Usuario> ObtenerListaUsuariosEstado(int estado)
        {
            //recordar el where para solo los activos
            IEnumerable<Usuario> query = (IEnumerable<Usuario>)UsuarioLN.QueryListaUsuario();
            IEnumerable<Usuario> lista = query.Where(x => x.Log_Activo == estado || estado == 2);
            return lista;
        }
        public static IEnumerable<Usuario> ObtenerListaUsuariosRol(int estado, int rol)
        {
            //recordar el where para solo los activos
            IEnumerable<Usuario> query = (IEnumerable<Usuario>)UsuarioLN.QueryListaUsuario();
            IEnumerable<Usuario> lista = query.Where(x => (x.Log_Activo == estado || estado == 2) && x.ID_Rol == rol);
            return lista;
        }
        /// <summary>
        /// Obtiene un usuario por su campo identificador (El correo)
        /// </summary>
        /// <param name="correo"></param>
        /// <returns></returns>

        public static Usuario ObtenerUsuario(String correo)
        {
            var db = new BD_EcomonedasContext();
            Usuario us = db.Usuario.Where(x => x.Correo.Equals(correo)).FirstOrDefault<Usuario>();
            return us;
        }
        /// <summary>
        /// Obtiene un usuario por su campo identificador (El correo, su rol, y su estado)
        /// </summary>
        /// <param name="correo"></param>
        /// <returns></returns>

        public static Usuario ObtenerUsuario(String correo, int ID_Rol, int logEstado)
        {
            var db = new BD_EcomonedasContext();
            Usuario us = db.Usuario.Where(x => x.Correo.Equals(correo) && x.ID_Rol == ID_Rol && x.Log_Activo == logEstado).FirstOrDefault<Usuario>();
            return us;
        }
        //Falta el autenticar

        /// <summary>
        /// Guardar usuario completo
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="apellido1"></param>
        /// <param name="apellido2"></param>
        /// <param name="contrasenia"></param>
        /// <param name="Direccion"></param>
        /// <param name="telefono"></param>
        /// <param name="id_Rol"></param>
        /// <param name="correo"></param>
        /// <returns></returns>
        public static bool GuardarUsuario(String nombre, String apellido1, String apellido2, String contrasenia, String direccion, String telefono, String id_Rol, String correo = "")
        {
            var db = new BD_EcomonedasContext();
            bool esNuevo = false;
            Usuario miUsuario;

            miUsuario = db.Usuario.Where(x => x.Correo.Equals(correo)).FirstOrDefault();
            if (miUsuario == null)
            {
                miUsuario = new Usuario();
                miUsuario.Correo = correo;
                esNuevo = true;
            }

            miUsuario.Nombre = nombre;
            miUsuario.Apellido1 = apellido1;
            miUsuario.Apellido2 = apellido2;
            miUsuario.Contrasenia = contrasenia;
            miUsuario.Direccion = direccion;
            miUsuario.Telefono = Convert.ToInt32(telefono);
            miUsuario.ID_Rol = Convert.ToInt32(id_Rol);
            miUsuario.Log_Activo = miUsuario.Log_Activo == null ? 1 : miUsuario.Log_Activo;

            if (esNuevo)
            {
                db.Usuario.Add(miUsuario);
                //Enviar correo de confirmacion
                try
                {
                    CorreoLN.enviar_Correo(miUsuario.Correo,
                    String.Format(("Bienvenido {0} {1} {2}\nEcoMonedas te da la bienvenida y te felicita por formar parte de esta noble iniciativa.\nEsperamos que la experiencia sea de tu agrado\n\nAdjunto te agregamos tus datos de usuario, para el ingreso a la aplicación\nCorreo que establesiste: {3}\nContraseña generada: {4}. (Si gustas al ingresar podés cambiar esta contraseña)"), miUsuario.Nombre, miUsuario.Apellido1, miUsuario.Apellido2, miUsuario.Correo, miUsuario.Contrasenia), "Bienvenido al programa EcoMonedas");
                }
                catch (Exception ex)
                {

                }
            }

            db.SaveChanges();
            return true;
        }
        /// <summary>
        /// Guardar usuario, con generador de contraseña
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="apellido1"></param>
        /// <param name="apellido2"></param>
        /// <param name="contrasenia"></param>
        /// <param name="generarContrasenia"></param>
        /// <param name=""></param>
        /// <returns></returns>
        public static bool GuardarUsuario(String nombre, String apellido1, String apellido2, String direccion, String telefono, String id_Rol, bool generarContrasenia, String correo = "")
        {
            try
            {
                var db = new BD_EcomonedasContext();
                bool esNuevo = false;
                Usuario miUsuario;

                miUsuario = db.Usuario.Where(x => x.Correo.Equals(correo)).FirstOrDefault<Usuario>();
                if (miUsuario == null)
                {
                    miUsuario = new Usuario();
                    miUsuario.Correo = correo;
                    esNuevo = true;
                }

                miUsuario.Nombre = nombre;
                miUsuario.Apellido1 = apellido1;
                miUsuario.Apellido2 = apellido2;
                miUsuario.Direccion = direccion;
                miUsuario.Telefono = Convert.ToInt32(telefono);
                miUsuario.ID_Rol = Convert.ToInt32(id_Rol);
                miUsuario.Log_Activo = miUsuario.Log_Activo == null ? 1 : miUsuario.Log_Activo;
                if (generarContrasenia || esNuevo)
                {
                    miUsuario.Contrasenia = UsuarioLN.GenerarContrasenia();
                    //Enviar correo
                }

                if (esNuevo)
                {
                    db.Usuario.Add(miUsuario);
                    //Enviar correo de confirmacion
                    try
                    {
                        CorreoLN.enviar_Correo(miUsuario.Correo,
                    String.Format(("Bienvenido {0} {1} {2}\nEcoMonedas te da la bienvenida y te felicita por formar parte de esta noble iniciativa como un administrador de nuestros centros de acopio.\nEsperamos que la experiencia sea de tu agrado\n\nAdjunto te agregamos tus datos de usuario, para el ingreso a la aplicación\nCorreo que establesiste: {3}\nContraseña generada: {4}. (Si gustas al ingresar podés cambiar esta contraseña)"), miUsuario.Nombre, miUsuario.Apellido1, miUsuario.Apellido2, miUsuario.Correo, miUsuario.Contrasenia), "Bienvenido al programa EcoMonedas");

                    }
                    catch (Exception)
                    {

                    }
                }
                else
                {
                    if (generarContrasenia)
                    {
                        try
                        {
                            CorreoLN.enviar_Correo(miUsuario.Correo,
                    String.Format(("Señor/Señora {0} {1} {2}\nEcoMonedas te informa que su contraseña ha sido reestablecida con éxito\nPor favor diríjase a nuestro sitio web y revise que su ingreso se pueda realizar.\nContraseña temporal: {3}\nGracias por ser parte de EcoMonedas, un proyecot verde."), miUsuario.Nombre, miUsuario.Apellido1, miUsuario.Apellido2, miUsuario.Contrasenia), "Reestablecimiento de la contraseña");
                        }
                        catch (Exception)
                        {
                            
                        }
                    }
                }
                db.SaveChanges();

                return true;
            }
            catch (EntryPointNotFoundException)
            {

                throw;
            }
        }
        /// <summary>
        /// Guardar datos editados del usuario
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="apellido1"></param>
        /// <param name="apellido2"></param>
        /// <param name="contrasenia"></param>
        /// <param name="Direccion"></param>
        /// <param name="telefono"></param>
        /// <param name="id_Rol"></param>
        /// <param name="correo"></param>
        /// <returns></returns>
        public static bool GuardarUsuario(Usuario us)
        {
            var db = new BD_EcomonedasContext();
            Usuario miUsuario;

            miUsuario = db.Usuario.Where(x => x.Correo.Equals(us.Correo)).FirstOrDefault();
            if (miUsuario == null)
            {
                return false;
            }

            miUsuario.Nombre = us.Nombre;
            miUsuario.Apellido1 = us.Apellido1;
            miUsuario.Apellido2 = us.Apellido2;
            miUsuario.Direccion = us.Direccion;
            miUsuario.Telefono = Convert.ToInt32(us.Telefono);
            miUsuario.Log_Activo = miUsuario.Log_Activo == null ? 1 : miUsuario.Log_Activo;
            

            db.SaveChanges();
            return true;
        }
        /// <summary>
        /// Guarda la nueva contraseña
        /// </summary>
        /// <param name="contrasenia"></param>
        /// <param name="correo"></param>
        /// <returns></returns>
        public static bool GuardarContrasenia(String contrasenia, String correo)
        {
            var db = new BD_EcomonedasContext();
            Usuario miUsuario;

            miUsuario = db.Usuario.Where(x => x.Correo.Equals(correo)).FirstOrDefault();
            if (miUsuario == null)
            {
                return false;
            }

            miUsuario.Contrasenia = contrasenia;


            db.SaveChanges();
            return true;
        }
        /// <summary>
        /// Método que cambia el estado. Si el estado esta en 0, lo coloca en 1 (Activo)
        /// Si el estado esta en 1, lo coloca 0 (inactivo) 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static bool CambiarEstadoUsuario(String correo)
        {
            if (!correo.Equals(""))
            {
                var db = new BD_EcomonedasContext();
                Usuario miUsuario = new Usuario();

                miUsuario = db.Usuario.Where(x => x.Correo.Equals(correo)).First<Usuario>();
                if (miUsuario.Log_Activo == 0)
                {
                    miUsuario.Log_Activo = 1;
                    try
                    {
                        CorreoLN.enviar_Correo(miUsuario.Correo,
                    String.Format(("Estimado {0} {1} {2},\n Le informamos que su cuenta ha sido reestablecida, y se le ha brindado nuevamente el acceso a nuestro sitio web"), miUsuario.Nombre, miUsuario.Apellido1, miUsuario.Apellido2), "Reactivación de cuenta");
                    }
                    catch (Exception)
                    {
                    }
                }
                else
                {
                    miUsuario.Log_Activo = 0;
                    try
                    {
                        CorreoLN.enviar_Correo(miUsuario.Correo,
                    String.Format(("Estimado {0} {1} {2},\nLamentamos informarle que por motivos de Terminos y condiciones de nuestra compañía su cuenta ha sido desactiva temporalmente o permanentemente.\nAgradecemos su compresión"), miUsuario.Nombre, miUsuario.Apellido1, miUsuario.Apellido2), "Desactivacion de cuenta");
                    }
                    catch (Exception)
                    {
                    }
                }
                db.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
        }
        public static Usuario AutenticarUsuario(String correo, String contrasenia)
        {
            var db = new BD_EcomonedasContext();
            Usuario us = db.Usuario.Where(x => x.Correo.Equals(correo) && x.Contrasenia.Equals(contrasenia) && x.Log_Activo == 1).FirstOrDefault<Usuario>();
            return us;
        }

        private static String GenerarContrasenia()
        {
            String abecedarioMayus = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            String abecedarioMinus = "abcdefghijklmnopqrstuvwxyz";
            String numeros = "0123456789";
            Random rand = new Random((int)DateTime.Now.Ticks);
            String contrasenia = "";
            int numRandom;
            int tipoCaracter;
            for (int i = 0; i < 12; i++)
            {
                numRandom = rand.Next(1, 3);
                if (numRandom == 1)
                {
                    tipoCaracter = rand.Next(1, 25);
                    contrasenia += abecedarioMayus[tipoCaracter];
                }
                else
                {
                    if (numRandom == 2)
                    {
                        tipoCaracter = rand.Next(1, 25);
                        contrasenia += abecedarioMinus[tipoCaracter];
                    }
                    else
                    {
                        tipoCaracter = rand.Next(0, 9);
                        contrasenia += numeros[tipoCaracter];
                    }
                }
            }
            return contrasenia;
        }


        public static IEnumerable<Usuario> ListaAdminAcopioLibres()
        {
            IEnumerable<Usuario> lista = ObtenerListaUsuariosRol(2, 2);
            List<Usuario> libres = new List<Usuario>();
            foreach (var admin in lista)
            {
                IEnumerable<Centro> listCentros= CentroLN.ObtenerCentroXIdAdmin(admin.Correo);
                if (listCentros.ToList().Count<1 && admin.Log_Activo==1)
                {
                    libres.Add(admin);
                }
            }
            return libres;
        }



    }
}
