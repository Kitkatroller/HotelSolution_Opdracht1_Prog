using Hotel.Domain.Managers;
using Hotel.Domain.Model;
using Hotel.Presentation.Customer.Model;
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

namespace Hotel.Presentation.Customer
{
    /// <summary>
    /// Interaction logic for MemberWindow.xaml
    /// </summary>
    public partial class MemberWindow : Window
    {
        public event EventHandler<Member> MemberAdded;

        private int CustomerId;
        public MemberWindow()
        {
            InitializeComponent();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (NameTextBox.Text == string.Empty)
            {
                MessageBox.Show("Must have a name", "add");
            }
            else
            {
                if (BirthDay.SelectedDate.HasValue && BirthDay.SelectedDate.Value <= DateTime.Today)
                {
                    string memberName = NameTextBox.Text;
                    DateTime selectedDateTime = BirthDay.SelectedDate.Value;
                    DateOnly dateOnly = DateOnly.FromDateTime(selectedDateTime);
                    Member m = new Member(memberName, dateOnly);

                    // Trigger the event
                    MemberAdded?.Invoke(this, m);
                    Close();
                }
                else
                {
                    MessageBox.Show("Pick a date before today", "add");
                }
            }
        }
    }
}
