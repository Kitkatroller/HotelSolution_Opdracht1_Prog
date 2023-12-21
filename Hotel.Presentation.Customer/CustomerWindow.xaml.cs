using Hotel.Domain.Managers;
using Hotel.Domain.Model;
using Hotel.Presentation.Customer.Model;
using Hotel.Util;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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

namespace Hotel.Presentation.Customer
{
    /// <summary>
    /// Interaction logic for CustomerWindow.xaml
    /// </summary>
    public partial class CustomerWindow : Window
    {
        public CustomerUI CustomerUI { get; set; }
        public CustomerWindow(CustomerUI customerUI)
        {
            InitializeComponent();
            this.CustomerUI = customerUI;
            if (CustomerUI != null)
            {
                IdTextBox.Text = CustomerUI.Id.ToString();
                NameTextBox.Text = CustomerUI.Name;
                EmailTextBox.Text = CustomerUI.Email;
                PhoneTextBox.Text = CustomerUI.Phone;
            }
        }
        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            CustomerManager manager = new CustomerManager(RepositoryFactory.CustomerRepository);

            if (CustomerUI == null)
            {
                // Create a new Customer object
                Address address = new Address(CityTextBox.Text, StreetTextBox.Text, ZipTextBox.Text, HouseNumberTextBox.Text);
                ContactInfo contactInfo = new ContactInfo(EmailTextBox.Text, PhoneTextBox.Text, address);
                Hotel.Domain.Model.Customer newCustomer = new Hotel.Domain.Model.Customer(NameTextBox.Text, contactInfo);

                // Add the new customer using CustomerManager
                manager.AddCustomer(newCustomer);

                // Update CustomerUI with the new customer's ID if needed
                CustomerUI = new CustomerUI(newCustomer.Id, NameTextBox.Text, EmailTextBox.Text, address.ToString(), PhoneTextBox.Text, 0);
            }
            else
            {
                // Retrieve the existing customer
                if (IdTextBox.Text == CustomerUI.Id.ToString())
                {
                    int id;
                    bool success = int.TryParse(IdTextBox.Text, out id);
                    var existingCustomer = manager.GetCustomerById(id);

                    if (existingCustomer != null)
                    {
                        // Update existing customer
                        existingCustomer.Name = NameTextBox.Text;
                        existingCustomer.Contact.Email = EmailTextBox.Text;
                        existingCustomer.Contact.Phone = PhoneTextBox.Text;
                        existingCustomer.Contact.AddressId = existingCustomer.Contact.AddressId;
                        existingCustomer.Contact.Address = new Address(CityTextBox.Text, StreetTextBox.Text, ZipTextBox.Text, HouseNumberTextBox.Text);

                        // Update the customer using CustomerManager
                        manager.UpdateCustomer(existingCustomer);
                        CustomerUI = new CustomerUI(existingCustomer.Id, NameTextBox.Text, EmailTextBox.Text, existingCustomer.Contact.Address.ToString(), PhoneTextBox.Text, 0);
                    }
                    else
                    {
                        MessageBox.Show("Customer not found.", "Error");
                    }
                }
                else
                {
                    MessageBox.Show("No customer selected.", "Error");
                }
            }
            

            DialogResult = true;
            Close();
        }
    }
}
