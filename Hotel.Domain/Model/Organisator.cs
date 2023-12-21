using Hotel.Domain.Exceptions;
using System.Collections.Generic;

namespace Hotel.Domain.Model
{
    public class Organisator
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int ContactInfoId { get; set; }
        public ContactInfo Contact { get; set; }
        private List<Activiteit> _activiteiten = new List<Activiteit>();

        public Organisator(int id, string name, int contactInfoId, ContactInfo contact)
        {
            Id = id;
            Name = name;
            ContactInfoId = contactInfoId;
            Contact = contact;
        }

        public Organisator(int id, string name, ContactInfo contact)
        {
            Id = id;
            Name = name;
            Contact = contact;
        }

        public Organisator(string name, ContactInfo contact)
        {
            Name = name;
            Contact = contact;
        }

        public IReadOnlyList<Activiteit> GetActiviteiten() { return _activiteiten.AsReadOnly(); }
        public void AddActiviteit(Activiteit activiteit)
        {
            if (!_activiteiten.Contains(activiteit))
                _activiteiten.Add(activiteit);
            else
                throw new OrganisatorException("AddActiviteit");
        }
        public void RemoveActiviteit(Activiteit activiteit)
        {
            if (_activiteiten.Contains(activiteit))
                _activiteiten.Remove(activiteit);
            else
                throw new OrganisatorException("RemoveActiviteit");
        }

        // Additional methods or logic related to Organisator
    }
}
