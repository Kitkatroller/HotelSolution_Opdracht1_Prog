using Hotel.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Domain.Interfaces
{
    public interface IInschrijvingRepository
    {
        int AantalAllIngeschreven(int activiteitenId);
        void SchrijfNieuweMembersIn(List<Member> membersToParticipate, float cost);
    }
}
