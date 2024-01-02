using Hotel.Domain.Interfaces;
using Hotel.Persistence.Repositories;
using System.Configuration;

namespace Hotel.Util
{
    public static class RepositoryFactory
    {
        public static ICustomerRepository CustomerRepository { get { return new CustomerRepository(ConfigurationManager.ConnectionStrings["Hotel"].ConnectionString); } }

        public static IOrganisatorRepository OrganisatorRepository
        {
            get
            {
                return new OrganisatorRepository(ConfigurationManager.ConnectionStrings["Hotel"].ConnectionString);
            }
        }

        public static IActiviteitRepository ActiviteitRepository
        {
            get
            {
                return new ActiviteitRepository(ConfigurationManager.ConnectionStrings["Hotel"].ConnectionString);
            }
        }

        public static IInschrijvingRepository InschrijvingRepository
        {
            get
            {
                return new InschrijvingRepository(ConfigurationManager.ConnectionStrings["Hotel"].ConnectionString);
            }
        }

    }
}