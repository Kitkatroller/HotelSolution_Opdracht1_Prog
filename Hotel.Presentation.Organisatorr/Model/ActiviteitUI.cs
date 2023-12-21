using System;
using System.ComponentModel;

namespace Hotel.Presentation.Organisator.Model
{
    public class ActiviteitUI : INotifyPropertyChanged
    {
        public ActiviteitUI(int? id, string name, string description, string location, TimeSpan duration, DateTime date, int availablePlaces, float adultPrice, float childPrice, float discount)
        {
            Id = id;
            Name = name;
            Description = description;
            Location = location;
            Duration = duration;
            Date = date;
            AvailablePlaces = availablePlaces;
            AdultPrice = adultPrice;
            ChildPrice = childPrice;
            Discount = discount;
        }

        public int? Id { get; set; }
        private string _name;
        public string Name { get { return _name; } set { _name = value; OnPropertyChanged(); } }
        private string _description;
        public string Description { get { return _description; } set { _description = value; OnPropertyChanged(); } }
        private string _location;
        public string Location { get { return _location; } set { _location = value; OnPropertyChanged(); } }
        private TimeSpan _duration;
        public TimeSpan Duration { get { return _duration; } set { _duration = value; OnPropertyChanged(); } }
        private DateTime _date;
        public DateTime Date { get { return _date; } set { _date = value; OnPropertyChanged(); } }
        private int _availablePlaces;
        public int AvailablePlaces { get { return _availablePlaces; } set { _availablePlaces = value; OnPropertyChanged(); } }
        private float _adultPrice;
        public float AdultPrice { get { return _adultPrice; } set { _adultPrice = value; OnPropertyChanged(); } }
        private float _childPrice;
        public float ChildPrice { get { return _childPrice; } set { _childPrice = value; OnPropertyChanged(); } }
        private float _discount;
        public float Discount { get { return _discount; } set { _discount = value; OnPropertyChanged(); } }

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged(string name = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }
    }
}
