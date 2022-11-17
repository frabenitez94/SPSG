using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.SPSGContext
{
    public class SPSGContext : SPSGEntities
    {
        private static readonly String strConnection = "name=SPSGEntities";
        public SPSGContext() 
        {
            base.Configuration.LazyLoadingEnabled = false;
        }
    }
}
