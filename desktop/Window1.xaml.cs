using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace desktop
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        private string _currentCaptchaId;
        private string _currentCaptchaCode;

        private string _currentRegCaptchaId;
        private string _currentRegCaptchaCode;
      
        public Window1()
        {
            InitializeComponent();
            LoadCaptcha();
            LoadRegCaptcha();
        }
        private void LoadCaptcha()
        {
            _currentCaptchaCode = "ABC123";
            _currentCaptchaId = Guid.NewGuid().ToString();
            CaptchaImage.Source = GenerateCaptchaImage(_currentCaptchaCode);
        }
        private ImageSource GenerateCaptchaImage(string currentCaptchaCode)
        {
            var drawingVisual = new DrawingVisual();
            using (var context = drawingVisual.RenderOpen())
            {
                var random = new Random();
                context.DrawRectangle(Brushes.White, null, new Rect(0, 0, 200, 80));
                for (int i = 0; i < 20; i++)
                {
                    var pen = new Pen(new SolidColorBrush(Color.FromRgb(
                        (byte)random.Next(100, 255),
                        (byte)random.Next(100, 255),
                        (byte)random.Next(100, 255))), 1.5);

                    context.DrawLine(pen,
                        new Point(random.Next(0, 200), random.Next(0, 80)),
                        new Point(random.Next(0, 200), random.Next(0, 80)));
                }
                for (int i = 0; i < captchaCode.Length; i++)
                {
                    var brush = new SolidColorBrush(Color.FromRgb(
                        (byte)random.Next(50, 200),
                        (byte)random.Next(50, 200),
                        (byte)random.Next(50, 200)));
                    double angle = random.Next(-15, 15);
                    int xOffset = 25 + (i * 30) + random.Next(-3, 3);
                    int yOffset = 25 + random.Next(-5, 5);

                    context.PushTransform(new RotateTransform(angle, xOffset, yOffset));
                    FormattedText formattedText = null;
                    context.DrawText(formattedText, new Point(xOffset, yOffset));
                    context.Pop();
                }
                for (int i = 0; i < 300; i++)
                {
                    context.DrawRectangle(Brushes.Gray, null,
                        new Rect(random.Next(0, 200), random.Next(0, 80), 1, 1));
                }
                for (int i = 0; i < 10; i++)
                {
                    context.DrawEllipse(null, new Pen(Brushes.LightGray, 1),
                        new Point(random.Next(0, 200), random.Next(0, 80)),
                        random.Next(3, 10), random.Next(3, 10));
                }
            }
            return new DrawingImage(drawingVisual.Drawing);
        }
        internal class captchaCode
        {
            public static int Length { get; internal set; }
        }
        private void LoadRegCaptcha()
        {
            _currentRegCaptchaCode = "XYZ789";
            _currentRegCaptchaId = Guid.NewGuid().ToString();
        }
        private void RegRefreshCaptcha_Click(object sender, RoutedEventArgs e)
        {
            LoadRegCaptcha();
        }

        private void RefreshCaptcha_Click(object sender, RoutedEventArgs e)
        {
            LoadCaptcha();
        }
        private void Login_Click(object sender, RoutedEventArgs e)
        {
            if (CaptchaCodeBox.Text != _currentCaptchaCode)
            {
                MessageBox.Show("Неверный код с картинки");
                LoadCaptcha();
                return;
            }
            MessageBox.Show("Вход выполнен");
            var Window1 = new Window1();
            Window1.Show();
            this.Close();
        }
        private void Register_Click(object sender, RoutedEventArgs e)
        {
            if (RegCaptchaCodeBox.Text != _currentRegCaptchaCode)
            {
                MessageBox.Show("Неверный код с картинки");
                LoadRegCaptcha();
                return;
            }
            MessageBox.Show("Регистрация успешна");
        }
        private void Products_Click(object sender, RoutedEventArgs e)
        {
           
        }
    }
}
    
