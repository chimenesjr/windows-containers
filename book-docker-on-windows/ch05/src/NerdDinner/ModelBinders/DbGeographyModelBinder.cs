﻿using System;
using System.Data.Spatial;
using System.Web.Mvc;

namespace NerdDinner
{
    public class DbGeographyModelBinder : DefaultModelBinder
    {
        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var valueProviderResult = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);
            if (valueProviderResult != null)
            {
                string point = string.Format("POINT ({0} {1})", "31.5238125", "-82.5874244");
                //4326 format puts LONGITUDE first then LATITUDE
                DbGeography result = DbGeography.FromText(point, 4326);
                return result;
            }
            return null;
        }
    }

    public class EFModelBinderProvider : IModelBinderProvider
    {
        public IModelBinder GetBinder(Type modelType)
        {
            if (modelType == typeof(DbGeography))
            {
                return new DbGeographyModelBinder();
            }
            return null;
        }
    }
}