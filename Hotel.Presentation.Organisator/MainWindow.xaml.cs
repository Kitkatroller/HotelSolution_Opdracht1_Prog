using Hotel.Presentation.Organisator.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private ObservableCollection<OrganisatorUI> OrganisatorUIs = new ObservableCollection<OrganisatorUI>();
        //private CustomerManager customerManager;
        string conn = @"Data Source=RAZER-LAPTOP-EP\SQLEXPRESS;Initial Catalog=Hotel;Integrated Security=True";

        public MainWindow()
        {
            InitializeComponent();
            customerManager = new CustomerManager(RepositoryFactory.CustomerRepository);
            customerUIs = new ObservableCollection<CustomerUI>(customerManager.GetCustomers(null).Select(x => new CustomerUI(x.Id, x.Name, x.Contact.Email, x.Contact.Address.ToString(), x.Contact.Phone, x.GetMembers().Count)).ToList());
            CustomerDataGrid.ItemsSource = customerUIs;
        }

        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void MenuItemAddOrganisator_Click(object sender, RoutedEventArgs e)
        {
            
        }
        private void MenuItemDeleteOrganisator_Click(object sender, RoutedEventArgs e)
        {
           
        }
        private void MenuItemUpdateOrganisator_Click(object sender, RoutedEventArgs e)
        {
            
        }
    }
}
