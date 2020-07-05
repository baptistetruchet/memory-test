import { axiosInstance } from "./axios-instance";

export const getCountries = () => {
  return axiosInstance.get("countries");
};

export const getSummary = (country) => {
  return axiosInstance.get(`transactions/summary?country=${country}`);
};

export const getMonthlyRevenue = (country) => {
  return axiosInstance.get(`transactions/monthly_revenue?country=${country}`);
};
