using Hotel.Domain.Managers;
using Hotel.Domain.Model;
using Hotel.Presentation.Organisator.Model; // Update this namespace as needed
using Hotel.Util;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;

namespace Hotel.Presentation.Organisator
{
    public partial class OrganisatorWindow : Window
    {
        public OrganisatorUI OrganisatorUI { get; set; }
        private ObservableCollection<ActiviteitUI> activiteitUIs;
        private OrganisatorManager organisatorManager;

        public OrganisatorWindow(OrganisatorUI organisatorUI)
        {
            InitializeComponent();
            this.OrganisatorUI = organisatorUI;
            organisatorManager = new OrganisatorManager(RepositoryFactory.OrganisatorRepository);
            IdTextBox.IsReadOnly = true;

            LoadOrganisatorDetails();
            LoadActiviteiten();
        }

        private void LoadOrganisatorDetails()
        {
            if (OrganisatorUI != null)
            {
                IdTextBox.Text = OrganisatorUI.Id.ToString();
                NameTextBox.Text = OrganisatorUI.Name;
                EmailTextBox.Text = OrganisatorUI.Email;
                PhoneTextBox.Text = OrganisatorUI.Phone;

                AddButton.Content = "Update";
            }
        }

        private void LoadActiviteiten()
        {
            if (OrganisatorUI != null && OrganisatorUI.Id.HasValue)
            {
                var organisator = organisatorManager.GetOrganisatorById(OrganisatorUI.Id.Value);

                if (organisator != null)
                {
                    activiteitUIs = new ObservableCollection<ActiviteitUI>(
                        organisator.GetActiviteiten().Select(a => new ActiviteitUI(
                            a.Id, a.Name, a.Description, a.Location, a.Duration, a.Date,
                            a.AvailablePlaces, a.AdultPrice, a.ChildPrice, a.Discount))
                        .ToList());
                    ActiviteitenDataGrid.ItemsSource = activiteitUIs;
                }
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            OrganisatorManager manager = new OrganisatorManager(RepositoryFactory.OrganisatorRepository);

            if (OrganisatorUI == null)
            {
                // Create a new Organisator object
                Address address = new Address(CityTextBox.Text, StreetTextBox.Text, ZipTextBox.Text, HouseNumberTextBox.Text);
                ContactInfo contactInfo = new ContactInfo(EmailTextBox.Text, PhoneTextBox.Text, address);
                Hotel.Domain.Model.Organisator newOrganisator = new Hotel.Domain.Model.Organisator(NameTextBox.Text, contactInfo);

                // Add the new organisator using OrganisatorManager
                manager.AddOrganisator(newOrganisator);

                // Update OrganisatorUI with the new organisator's ID if needed
                OrganisatorUI = new OrganisatorUI(newOrganisator.Id, NameTextBox.Text, EmailTextBox.Text, address.ToString(), PhoneTextBox.Text);
            }
            else
            {
                // Retrieve the existing organisator
                if (IdTextBox.Text == OrganisatorUI.Id.ToString())
                {
                    int id;
                    bool success = int.TryParse(IdTextBox.Text, out id);
                    var existingOrganisator = manager.GetOrganisatorById(id);

                    if (existingOrganisator != null)
                    {
                        // Update existing organisator
                        existingOrganisator.Name = NameTextBox.Text;
                        existingOrganisator.Contact.Email = EmailTextBox.Text;
                        existingOrganisator.Contact.Phone = PhoneTextBox.Text;
                        existingOrganisator.Contact.Address = new Address(CityTextBox.Text, StreetTextBox.Text, ZipTextBox.Text, HouseNumberTextBox.Text);

                        // Update the organisator using OrganisatorManager
                        manager.UpdateOrganisator(existingOrganisator);
                        OrganisatorUI = new OrganisatorUI(existingOrganisator.Id, NameTextBox.Text, EmailTextBox.Text, existingOrganisator.Contact.Address.ToString(), PhoneTextBox.Text);
                    }
                    else
                    {
                        MessageBox.Show("Organisator not found.", "Error");
                    }
                }
                else
                {
                    MessageBox.Show("No organisator selected.", "Error");
                }
            }

            DialogResult = true;
            Close();
        }

        private void MenuItemAddActiviteit_Click(object sender, RoutedEventArgs e)
        {
            if (OrganisatorUI == null) MessageBox.Show("You must first create the organisation before you can add any activities.", "add");
            else
            {           
                ActiviteitenWindow w = new ActiviteitenWindow(null, OrganisatorUI.Id);
                if (w.ShowDialog() == true) ;
                LoadActiviteiten();
            }
        }

        private void MenuItemUpdateActiviteit_Click(object sender, RoutedEventArgs e)
        {
            if (ActiviteitenDataGrid.SelectedItem == null) MessageBox.Show("not selected", "update");
            else
            {
                ActiviteitUI toChange = (ActiviteitUI)ActiviteitenDataGrid.SelectedItem;

                ActiviteitenWindow w = new ActiviteitenWindow(toChange.Id, null);
                if (w.ShowDialog() == true) ;
                LoadActiviteiten();
            }
        }
    }
}
