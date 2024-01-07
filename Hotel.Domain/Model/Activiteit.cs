public class Activiteit
{
    public int Id { get; set; }
    public string Description { get; set; }
    public string Location { get; set; }
    public TimeSpan Duration { get; set; }
    public string Name { get; set; }
    public DateTime Date { get; set; }
    public int AvailablePlaces { get; set; }
    public float AdultPrice { get; set; }
    public float ChildPrice { get; set; }
    public float Discount { get; set; }
    public int OrganisatorId { get; set; }

    // Parameterless constructor
    public Activiteit() { }

    // Full constructor
    public Activiteit(int id, string description, string location, TimeSpan duration, string name, DateTime date, int availablePlaces, float adultPrice, float childPrice, float discount, int organisatorId)
    {
        Id = id;
        Description = description;
        Location = location;
        Duration = duration;
        Name = name;
        Date = date;
        AvailablePlaces = availablePlaces;
        AdultPrice = adultPrice;
        ChildPrice = childPrice;
        Discount = discount;
        OrganisatorId = organisatorId;
    }

    // Minimal constructor
    public Activiteit(string name, DateTime date, int availablePlaces)
    {
        Name = name;
        Date = date;
        AvailablePlaces = availablePlaces;
    }

    // Constructor
    public Activiteit(string description, string location, TimeSpan duration, string name, DateTime date, int availablePlaces, float adultPrice, float childPrice, float discount, int organisatorId)
        : this(0, description, location, duration, name, date, availablePlaces, adultPrice, childPrice, discount, organisatorId)
    {
    }
}
