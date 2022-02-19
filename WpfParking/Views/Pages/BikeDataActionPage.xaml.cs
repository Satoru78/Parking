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
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfParking.Context;
using WpfParking.Model;

namespace WpfParking.Views.Pages
{
    /// <summary>
    /// Логика взаимодействия для BikeDataActionPage.xaml
    /// </summary>
    public partial class BikeDataActionPage : Page
    {
        public List<Status> Statuses { get; set; }
        public List<Client> Clients { get; set; }
        public List<Model.Type> Types { get; set; }
        public Bike Bike { get; set; }
        public BikeDataActionPage(Bike bike)
        {
            InitializeComponent();
            Types = DataApp.pb.Type.ToList();
            Statuses = DataApp.pb.Status.ToList();
            Clients = DataApp.pb.Client.ToList();
            Bike = bike;
            this.DataContext = this;
        }
        //Сохранение данных
        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (Bike.ID == 0)
            {
                DataApp.pb.Bike.Add(Bike);
            }
            DataApp.pb.SaveChanges();
            MessageBox.Show("Проверьте список!", "Данные внесены", MessageBoxButton.OK, MessageBoxImage.Information);
            NavigationService.GoBack();
        }
    }
}

