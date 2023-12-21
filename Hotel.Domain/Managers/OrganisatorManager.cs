using Hotel.Domain.Exceptions;
using Hotel.Domain.Interfaces;
using Hotel.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Domain.Managers
{
    public class OrganisatorManager
    {
        private IOrganisatorRepository _organisatorRepository;

        public OrganisatorManager(IOrganisatorRepository organisatorRepository)
        {
            _organisatorRepository = organisatorRepository;
        }

        public IReadOnlyList<Organisator> GetOrganisator(string filter)
        {
            try
            {
                return _organisatorRepository.GetOrganisators(filter);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("GetCustomers");
            }
        }

        public void AddOrganisator(Organisator organisator)
        {
            try
            {
                _organisatorRepository.AddOrganisator(organisator);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("AddCustomer", ex);
            }
        }

        public void UpdateOrganisator(Organisator organisator)
        {
            try
            {
                _organisatorRepository.UpdateOrganisator(organisator);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("UpdateCustomer", ex);
            }
        }

        public Organisator GetOrganisatorById(int organisatorId)
        {
            try
            {
                return _organisatorRepository.GetOrganisator(organisatorId);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("GetCustomerById", ex);
            }
        }
    }
}
