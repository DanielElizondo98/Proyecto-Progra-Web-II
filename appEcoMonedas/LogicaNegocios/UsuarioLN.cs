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
        public static bool GuardarUsuario(String nombre, String apellido1, String apellido2, String contrasenia, String direccion, String telefono, String id_Rol, String correo ="")
        {
            var db = new BD_EcomonedasContext();
            bool esNuevo = false;
            Usuario miUsuario = new Usuario();

            miUsuario = db.Usuario.Where(x => x.Correo.Equals(correo)).FirstOrDefault();
           if(miUsuario == null)
            {
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
        public static bool GuardarUsuario(String nombre, String apellido1, String apellido2, String direccion, String telefono, String id_Rol, bool generarContrasenia, String correo="")
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
                }
                db.SaveChanges();

                return true;
            }
            catch (EntryPointNotFoundException ex)
            {

                throw;
            }
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
                }
                else
                {
                    miUsuario.Log_Activo = 0;
                }
                db.SaveChanges();
                return true;
            }
            else
            {
                return false;
            }
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
    }
}
