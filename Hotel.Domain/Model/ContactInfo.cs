using Hotel.Domain.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Hotel.Domain.Model
{
    public class ContactInfo
    {
        private string _email;
        private string _phone;
        private Address _address;
        public int AddressId;

        public ContactInfo(string email, string phone, Address address)
        {
            _email = email;
            _phone = phone;
            _address = address;
        }
        public ContactInfo(string email, string phone, int addressId, Address address)
        {
            _email = email;
            _phone = phone;
            _address = address;
            AddressId = addressId;
        }

        public string Email
        {
            get => _email;
            set
            {
                if (string.IsNullOrWhiteSpace(value) || !value.Contains("@"))
                    throw new CustomerException("Email must contain the @ character.");
                _email = value;
            }
        }

        public string Phone
        {
            get => _phone;
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new CustomerException("Phone number cannot be empty.");
                _phone = value;
            }
        }

        public Address Address
        {
            get => _address;
            set => _address = value ?? throw new CustomerException("Address cannot be null.");
        }
    }
}
