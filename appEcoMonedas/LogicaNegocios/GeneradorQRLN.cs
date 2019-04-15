using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocios
{
    /// <summary>
    /// Clase encargada de la creacion y serializacion de los códigos QR
    /// </summary>
    public class GeneradorQRLN
    {
        /// <summary>
        /// Genera el QR segun un string determinado
        /// </summary>
        /// <param name="codigo"></param>
        /// <returns></returns>
        public static Image GenerarQR(string codigo)
        {
            QrEncoder qrEnconder = new QrEncoder(ErrorCorrectionLevel.H);
            QrCode qrCode = new QrCode();
            qrEnconder.TryEncode(codigo, out qrCode);

            GraphicsRenderer renderer = new GraphicsRenderer(new FixedCodeSize(400, QuietZoneModules.Zero), Brushes.Black, Brushes.White);

            MemoryStream ms = new MemoryStream();

            renderer.WriteToStream(qrCode.Matrix, ImageFormat.Png, ms);
            var imageTemporal = new Bitmap(ms);
            var imagen = new Bitmap(imageTemporal, new Size(new Point(207, 136)));

            return imagen;
        }

        /// <summary>
        /// Serializa la imágen en un arreglo de byte 
        /// </summary>
        /// <param name="imagen"></param>
        /// <returns></returns>
        public static byte[] SerializarImagen(Image imagen)
        {
            string sTemp = Path.GetTempFileName();
            FileStream fs = new FileStream(sTemp, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            imagen.Save(fs, ImageFormat.Png);
            fs.Position = 0;

            int imagenLength = Convert.ToInt32(fs.Length);
            byte[] bytes = new byte[imagenLength];
            fs.Read(bytes, 0, imagenLength);
            fs.Close();

            return bytes;
        }
    }
}
