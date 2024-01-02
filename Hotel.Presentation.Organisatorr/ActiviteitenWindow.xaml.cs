using Hotel.Domain.Managers;
using Hotel.Util;
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

namespace Hotel.Presentation.Organisator
{
    /// <summary>
    /// Interaction logic for ActiviteitenWindow.xaml
    /// </summary>
    public partial class ActiviteitenWindow : Window
    {
        private ActiviteitenManager activiteitenManager;
        private Activiteit currentActiviteit = new Activiteit();
        private int? _activiteitId;
        private int? _organisatorId;

        public ActiviteitenWindow(int? activiteitId, int? organisatorId)
        {
            InitializeComponent();
            activiteitenManager = new ActiviteitenManager(RepositoryFactory.ActiviteitRepository);
            IdTextBox.IsReadOnly = true;
            _activiteitId = activiteitId;
            _organisatorId = organisatorId;

            if (_activiteitId.HasValue)
            {
                int id = _activiteitId.Value;
                currentActiviteit = activiteitenManager.GetActiviteit(id);

                AddButton.Content = "Update";

                if (currentActiviteit != null)
                {
                    // Populate the textboxes with the currentActiviteit details
                    IdTextBox.Text = currentActiviteit.Id.ToString();
                    NameTextBox.Text = currentActiviteit.Name;
                    DescriptionTextBox.Text = currentActiviteit.Description;
                    LocationTextBox.Text = currentActiviteit.Location;
                    DurationTextBox.Text = currentActiviteit.Duration.ToString(); // Assuming Duration is a TimeSpan
                    ScheduleTextBox.Text = currentActiviteit.Date.ToString(); // Assuming Date is a DateTime
                    SpotsTextBox.Text = currentActiviteit.AvailablePlaces.ToString();
                    AdultCostTextBox.Text = currentActiviteit.AdultPrice.ToString();
                    ChildCostTextBox.Text = currentActiviteit.ChildPrice.ToString();
                    DiscountTextBox.Text = currentActiviteit.Discount.ToString();
                }
                else
                {
                    // Handle the case where no activiteit is found for the given id
                    MessageBox.Show("No activity found with the provided ID.");
                }
            }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (_activiteitId.HasValue)
            {
                // Create a new Activiteit instance with the updated details from the text boxes
                Activiteit updatedActiviteit = new Activiteit(
                    _activiteitId.Value, // Use the existing ID
                    DescriptionTextBox.Text,
                    LocationTextBox.Text,
                    TimeSpan.Parse(DurationTextBox.Text), // Assuming the DurationTextBox contains a valid TimeSpan string
                    NameTextBox.Text,
                    DateTime.Parse(ScheduleTextBox.Text), // Assuming the ScheduleTextBox contains a valid DateTime string
                    int.Parse(SpotsTextBox.Text),
                    float.Parse(AdultCostTextBox.Text),
                    float.Parse(ChildCostTextBox.Text),
                    float.Parse(DiscountTextBox.Text),
                    currentActiviteit.OrganisatorId // Assuming you want to keep the original OrganisatorId
                );

                // Call the update method (assuming you have one)
                activiteitenManager.UpdateActiviteit(updatedActiviteit);
            }
            else
            {
                // Create a new Activiteit instance with details from the text boxes
                Activiteit newActiviteit = new Activiteit(
                    DescriptionTextBox.Text,
                    LocationTextBox.Text,
                    TimeSpan.Parse(DurationTextBox.Text), // Assuming the DurationTextBox contains a valid TimeSpan string
                    NameTextBox.Text,
                    DateTime.Parse(ScheduleTextBox.Text), // Assuming the ScheduleTextBox contains a valid DateTime string
                    int.Parse(SpotsTextBox.Text),
                    float.Parse(AdultCostTextBox.Text),
                    float.Parse(ChildCostTextBox.Text),
                    float.Parse(DiscountTextBox.Text),
                    // You need to provide the OrganisatorId for the new activity
                    // This could be a fixed value, a value from another control, or a value from the current user context
                    _organisatorId.Value // Replace with actual OrganisatorId source
                );

                // Call the AddActiviteit method to insert the new activity
                activiteitenManager.AddActiviteit(newActiviteit);
            }
            Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
