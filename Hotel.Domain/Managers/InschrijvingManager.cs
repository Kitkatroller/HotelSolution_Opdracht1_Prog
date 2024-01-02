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
    public class InschrijvingManager
    {
        private IInschrijvingRepository _inschrijvingRepository;

        public InschrijvingManager(IInschrijvingRepository inschrijvingRepository)
        {
            _inschrijvingRepository = inschrijvingRepository;
        }

        public int AantalAllIngeschreven(int activiteitenId)
        {
            try
            {
                return _inschrijvingRepository.AantalAllIngeschreven(activiteitenId);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("GetCustomers");
            }
        }

        
        public void SchrijfNieuweMembersIn(List<Member> membersToParticipate, float cost)
        {
            try
            {
                _inschrijvingRepository.SchrijfNieuweMembersIn(membersToParticipate, cost);
            }
            catch (Exception ex)
            {
                throw new CustomerManagerException("GetCustomers");
            }
        }
    }
}
