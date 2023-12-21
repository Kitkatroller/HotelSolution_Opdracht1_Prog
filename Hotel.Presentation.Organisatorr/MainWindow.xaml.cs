using Hotel.Domain.Managers;
using Hotel.Persistence.Repositories;
using Hotel.Presentation.Organisator.Model;
using Hotel.Util;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Configuration;
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

namespace Hotel.Presentation.Organisator
{
    public partial class MainWindow : Window
    {
        private ObservableCollection<OrganisatorUI> organisatorUIs = new ObservableCollection<OrganisatorUI>();
        private OrganisatorManager organisatorManager;
        string conn = @"Data Source=RAZER-LAPTOP-EP\SQLEXPRESS;Initial Catalog=Hotel;Integrated Security=True";

        public MainWindow()
        {
            InitializeComponent();
            organisatorManager = new OrganisatorManager(RepositoryFactory.OrganisatorRepository);
            organisatorUIs = new ObservableCollection<OrganisatorUI>(organisatorManager.GetOrganisator(null).Select(x => new OrganisatorUI(x.Id, x.Name, x.Contact.Email, x.Contact.Address.ToString(), x.Contact.Phone)).ToList());
            OrganisatorDataGrid.ItemsSource = organisatorUIs;
        }

        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            organisatorUIs = new ObservableCollection<OrganisatorUI>(organisatorManager.GetOrganisator(SearchTextBox.Text).Select(x => new OrganisatorUI(x.Id, x.Name, x.Contact.Email, x.Contact.Address.ToString(), x.Contact.Phone)).ToList());
            OrganisatorDataGrid.ItemsSource = organisatorUIs;
        }

        private void MenuItemAddOrganisator_Click(object sender, RoutedEventArgs e)
        {
            OrganisatorWindow w = new OrganisatorWindow(null);
            if (w.ShowDialog() == true)
                organisatorUIs.Add(w.OrganisatorUI);
        }

        private void MenuItemUpdateOrganisator_Click(object sender, RoutedEventArgs e)
        {
            if (OrganisatorDataGrid.SelectedItem == null) MessageBox.Show("Not selected", "Update");
            else
            {
                OrganisatorWindow w = new OrganisatorWindow((OrganisatorUI)OrganisatorDataGrid.SelectedItem);
                w.ShowDialog();
            }
        }

        // Assuming you have a similar delete functionality for Organisator
        //private void MenuItemDeleteOrganisator_Click(object sender, RoutedEventArgs e)
        //{
        //    // Implement delete functionality similar to Customer
        //}
    }
}
