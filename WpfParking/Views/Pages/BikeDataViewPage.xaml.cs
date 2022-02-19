using System;
using System.Collections.Generic;
using System.IO;
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
    /// Логика взаимодействия для BikeDataViewPage.xaml
    /// </summary>
    public partial class BikeDataViewPage : Page
    {
        public List<Client> Clients;
        public List<Status> Statuses;
        public List<Bike> Bikes { get; set; }
        public BikeDataViewPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Data.ItemsSource = DataApp.pb.Bike.ToList();
        }
        // Добавление объекта
        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new BikeDataActionPage(new Bike()));
        }
        // Редактирование объекта
        private void EditButton_Click(object sender, RoutedEventArgs e)
        {

            var selectedItem = (Bike)Data.SelectedItem;
            if (selectedItem != null)
            {
                NavigationService.Navigate(new BikeDataActionPage(selectedItem));
            }
        }
        // Удаление объекта
        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            var selectedItem = (Bike)Data.SelectedItem;
            if (selectedItem != null)
            {
                DataApp.pb.Bike.Remove(selectedItem);
            }
            DataApp.pb.SaveChanges();
            MessageBox.Show("Проверьте список!", "Данные удалены", MessageBoxButton.OK, MessageBoxImage.Information);
            Page_Loaded(null, null);
        }
        //Поиск объектов
        private void Search_TextChanged(object sender, TextChangedEventArgs e)
        {
            var data = DataApp.pb.Bike.Where(item => item.Title.ToString().Contains(Search.Text) ||
            item.Client.FirstName.ToString().Contains(Search.Text) || item.Status.Title.ToString().Contains(Search.Text) ||
            item.Type.Title.ToString().Contains(Search.Text)).ToList();
            if (data.Any())
            {
                Data.Visibility = Visibility.Visible;
                GridNoResult.Visibility = Visibility.Collapsed;
                Data.ItemsSource = data;
            }
            else
            {
                Data.Visibility = Visibility.Collapsed;
                GridNoResult.Visibility = Visibility.Visible;
            }
        }
        //Переход на страницу с отображение истории
        private void ArchiveButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ArchiveDataPage());
        }

        private void CMBStatus_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SearchStatus((CMBStatus.SelectedItem as ComboBoxItem).Content.ToString(), Search.Text);
        }

        private void SearchStatus(string v, string text)
        {
            
        }


    }
}           
    
   
          


