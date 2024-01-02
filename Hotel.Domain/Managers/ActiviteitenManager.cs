using Hotel.Domain.Exceptions;
using Hotel.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Domain.Managers
{
    public class ActiviteitenManager
    {
        private IActiviteitRepository _activiteitenRepository;

        public ActiviteitenManager(IActiviteitRepository activiteitenRepository)
        {
            _activiteitenRepository = activiteitenRepository;
        }


        public Activiteit GetActiviteit(int id)
        {
            try
            {
                return _activiteitenRepository.GetActiviteit(id);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("GetCustomerById", ex);
            }
        }

        public void AddActiviteit(Activiteit activiteit)
        {
            try
            {
                _activiteitenRepository.AddActiviteit(activiteit);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("GetCustomerById", ex);
            }
        }

        public void UpdateActiviteit(Activiteit activiteit)
        {
            try
            {
                _activiteitenRepository.UpdateActiviteit(activiteit);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("GetCustomerById", ex);
            }
        }

        public List<Activiteit> GetAllActiviteiten()
        {
            try
            {
                return _activiteitenRepository.GetAllActiviteiten();
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("GetAllActiviteit", ex);
            }
        }


    }
}
