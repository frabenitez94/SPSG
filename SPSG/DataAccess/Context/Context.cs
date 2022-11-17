using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Context
{
    public class Context : SPSGEntities
    {
        private static readonly String strConnection = "name=SPSGEntities";
        public Context() : base(strConnection)
        {
            base.Configuration.LazyLoadingEnabled = false;
        }
    }
}
