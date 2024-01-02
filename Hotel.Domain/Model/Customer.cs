using Hotel.Domain.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Hotel.Domain.Model
{
    public class Customer
    {
        private const int MaxNameLength = 500;
        private string _name;

        public int Id { get; set; }
        public string Name
        {
            get => _name;
            set
            {
                if (string.IsNullOrEmpty(value) || value.Length > MaxNameLength)
                {
                    throw new CustomerException("Customer name must be non-empty and less than 500 characters.");
                }
                _name = value;
            }
        }
        public int ContactInfoId { get; set; }
        public ContactInfo Contact { get; set; }
        private List<Member> _members = new List<Member>(); //gn dubbels

        public Customer() { }
        public Customer(int id, string name, int contactInfoId, ContactInfo contact)
        {
            Id = id;
            Name = name;
            Contact = contact;
            ContactInfoId = contactInfoId;
        }

        public Customer(int id, string name, ContactInfo contact)
        {
            Id = id;
            Name = name;
            Contact = contact;
        }

        public Customer(string name, ContactInfo contact)
        {
            Name = name;
            Contact = contact;
        }

        public IReadOnlyList<Member> GetMembers() { return _members.AsReadOnly(); }
        public void AddMember(Member member)
        {
            if (!_members.Contains(member))
                _members.Add(member);
            else
                throw new CustomerException("AddMember");
        }
        public void RemoveMember(Member member) 
        {
            if (_members.Contains(member))
                _members.Remove(member);
            else
                throw new CustomerException("RemoveMember");
        }
        public void ClearMembers()
        {
            _members.Clear();
        }
    }
}
