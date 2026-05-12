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
    /// Логика взаимодействия для Window2.xaml
    /// </summary>
    public partial class Window2 : Window
    {
        private readonly ApiService _apiService;
        private ApiService apiService;
        public Window2()
        {
            InitializeComponent();
            _apiService = apiService;
            UserText.Text = $"Пользователь:";
            MainFrame.Content = new DashboardPage(_apiService);
        }
            private void AddProduct_Click(object sender, RoutedEventArgs e)
            {
              
            }
            private void Recipes_Click(object sender, RoutedEventArgs e)
            {
                MainFrame.Content = new RecipesPage(_apiService);
            }

            private void TechCards_Click(object sender, RoutedEventArgs e)
            {
                MainFrame.Content = new TechCardsPage(_apiService);
            }

            private void Orders_Click(object sender, RoutedEventArgs e)
            {
                MainFrame.Content = new ProductionOrdersPage(_apiService);
            }

            private void Batches_Click(object sender, RoutedEventArgs e)
            {
                MainFrame.Content = new ProductionBatchesPage(_apiService);
            }
            private void Monitoring_Click(object sender, RoutedEventArgs e)
            {
                MainFrame.Content = new MonitoringPage(_apiService);
            }
            private void DeviationReport_Click(object sender, RoutedEventArgs e)
            {
                MainFrame.Content = new DeviationReportPage(_apiService);
            }
            private void EfficiencyReport_Click(object sender, RoutedEventArgs e)
            {
                MainFrame.Content = new EfficiencyReportPage(_apiService);
            }
            private void ExtruderProgram_Click(object sender, RoutedEventArgs e)
            {
                MainFrame.Content = new ExtruderProgramPage(_apiService);
            }
            private void Settings_Click(object sender, RoutedEventArgs e)
            {
                MainFrame.Content = new SettingsPage(_apiService);
            }
        }
}
