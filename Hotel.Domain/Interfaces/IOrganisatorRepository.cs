using Hotel.Domain.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Domain.Interfaces
{
    public interface IOrganisatorRepository
    {
        void AddOrganisator(Organisator organisator);
        IReadOnlyList<Organisator> GetOrganisators(string filter);
        Organisator GetOrganisator(int id);
        void UpdateOrganisator(Organisator organisator);
    }
}
