using Hotel.Domain.Managers;
using Hotel.Domain.Model;
using Hotel.Util;
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

namespace Hotel.Presentation.Inschrijven
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private ActiviteitenManager _activiteitenManager;
        private CustomerManager _customerManager;
        private InschrijvingManager _inschrijvingManager;

        private List<Activiteit> alleActiviteiten = new List<Activiteit>();
        private ObservableCollection<Member> _chosenMembers = new ObservableCollection<Member>();

        Activiteit selectedActiviteit = new Activiteit();

        private int aantalKids = 0, aantalAdults = 0;

        private int aantalPlaatsenBeschikbaar;

        public MainWindow()
        {
            InitializeComponent();
            _activiteitenManager = new ActiviteitenManager(RepositoryFactory.ActiviteitRepository);
            _customerManager = new CustomerManager(RepositoryFactory.CustomerRepository);
            _inschrijvingManager = new InschrijvingManager(RepositoryFactory.InschrijvingRepository);

            alleActiviteiten = _activiteitenManager.GetAllActiviteiten();
            ActiviteitenDataGrid.ItemsSource = alleActiviteiten;

            // Assuming GetMembersByCustomerId returns an ObservableCollection<Member>
            MembersDataGrid.ItemsSource = _customerManager.GetMembersByCustomerId(1105);
            ChosenMembersDataGrid.ItemsSource = _chosenMembers;
        }

        private void BerekenKostenButton_Click(object sender, RoutedEventArgs e)
        {
            KostenTextBlock.Text = "$"+(aantalKids * selectedActiviteit.ChildPrice + aantalAdults * selectedActiviteit.AdultPrice).ToString();
        }

        private void InschrijvenButton_Click(object sender, RoutedEventArgs e)
        {
            List<Member> chosenMembersList = new List<Member>(_chosenMembers);
            _inschrijvingManager.SchrijfNieuweMembersIn(chosenMembersList, (aantalKids * selectedActiviteit.ChildPrice + aantalAdults * selectedActiviteit.AdultPrice));
            MessageBox.Show("Members zijn ingeschreven", "Information", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        private void MembersDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var grid = sender as DataGrid;
            if (grid != null && grid.SelectedItem != null)
            {
                var selectedMember = grid.SelectedItem as Member; 
                if (selectedMember != null && !_chosenMembers.Contains(selectedMember))
                {
                    _chosenMembers.Add(selectedMember);

                    DateOnly today = DateOnly.FromDateTime(DateTime.Now);

                    if ((today.Year - selectedMember.Birthday.Year) < 18)
                    {
                        aantalKids++;
                        KinderenTextBox.Text = aantalAdults.ToString();
                    }
                    else
                    {
                        aantalAdults++;
                        VolwassenenTextBox.Text = aantalAdults.ToString();
                    }
                }
                else
                {
                    MessageBox.Show("Member already added", "Information", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
        }
        private void ChosenMembersDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var grid = sender as DataGrid;
            if (grid != null && grid.SelectedItem != null)
            {
                var selectedMember = grid.SelectedItem as Member; 
                if (selectedMember != null)
                {
                    _chosenMembers.Remove(selectedMember);

                    DateOnly today = DateOnly.FromDateTime(DateTime.Now);

                    if ((today.Year - selectedMember.Birthday.Year) < 18)
                    {
                        aantalKids--;
                        KinderenTextBox.Text = aantalAdults.ToString();
                    }
                    else
                    {
                        aantalAdults--;
                        VolwassenenTextBox.Text = aantalAdults.ToString();
                    }
                }
            }
        }
        private void ActiviteitenDataGrid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            selectedActiviteit = ActiviteitenDataGrid.SelectedItem as Activiteit;
            aantalPlaatsenBeschikbaar = selectedActiviteit.AvailablePlaces; //- alleinscrhijvingen
        }
    }
}
