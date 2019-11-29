package com.customerapp.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.customerapp.model.persistance.Customer;
import com.customerapp.model.service.CustomerService;

@Controller

public class CustomerController {
	@Autowired
	private CustomerService customerService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homepage() {
		return "redirect:login";
	}

	@RequestMapping(value = "allcustomers", method = RequestMethod.GET)
	public String getcustomer(ModelMap map) {
		// mv.setViewName("allbooks");
		// mv.addObject("book",bookservice.getAllBooks());
		map.addAttribute("customers", customerService.getAllCustomers());
		return "all_customers";

	}

	@RequestMapping(value = "addcustomer", method = RequestMethod.GET)
	public String addCustomerGet(ModelMap map) {
		// adding an form bean
		map.addAttribute("customer", new Customer());
		return "addcustomer";
	}

	@RequestMapping(value = "addcustomer", method = RequestMethod.POST)
	public String addCustomerUpdatePost(@Valid Customer customer, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "addcustomer";
		} else {
			if (customer.getId() == 0) {
				customerService.addCustomer(customer);
			} else {
				customerService.updateCustomer(customer);
			}
			return "redirect:allcustomers";

		}
	}

	// controller for delete
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String deleteCustomer(HttpServletRequest req) {
		int customerId = Integer.parseInt(req.getParameter("id"));
		customerService.removeCustomer(customerId);
		return "redirect:allcustomers";

	}

	// controller for update
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateCustomerGet(HttpServletRequest req, ModelMap map) {
		int customerId = Integer.parseInt(req.getParameter("id"));
		Customer customerToBeUpdate = customerService.getCustomerById(customerId);
		map.addAttribute("customer", customerToBeUpdate);
		return "addcustomer";
		

	}
	/*
	 * @ModelAttribute(value="publist") public List<String> getPublisherList(){
	 * return Arrays.asList("wrox","bnh","adc","jkl"); }
	 */
}
