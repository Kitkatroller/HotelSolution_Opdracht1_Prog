using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel.Domain.Interfaces
{
    public interface IActiviteitRepository
    {
        List<Activiteit> GetAllActiviteiten();
        Activiteit GetActiviteit(int id);
        void AddActiviteit(Activiteit activiteit);
        void UpdateActiviteit(Activiteit activiteit);
    }
}
