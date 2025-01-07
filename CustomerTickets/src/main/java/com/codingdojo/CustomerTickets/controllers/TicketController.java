package com.codingdojo.CustomerTickets.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.CustomerTickets.models.Ticket;
import com.codingdojo.CustomerTickets.models.User;
import com.codingdojo.CustomerTickets.services.TicketService;
import com.codingdojo.CustomerTickets.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class TicketController {
	@Autowired
	private TicketService ticketService;

	@Autowired
	private UserService userService;
		
	@Autowired
	private HttpSession session;

	// read all tickets
	@GetMapping("/tickets")
	public String dashboard(Model model) {

		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		}
		User user = userService.findById(userId);
		List<Ticket> all_tickets= ticketService.allTickets();
		model.addAttribute("user", user);
		model.addAttribute("tickets",all_tickets);
		
		return "dashboard.jsp";
	}

	// Create new ticket
	@GetMapping("/tickets/new")
	public String newTeam(@ModelAttribute("ticket") Ticket ticket, Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");

		model.addAttribute("userId", userId);
		return "create_ticket.jsp";
	}

	@PostMapping("/tickets/new")
	public String addNewTeam(@Valid @ModelAttribute("ticket") Ticket ticket, BindingResult result, Model model) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		if (result.hasErrors()) {
			return "create_ticket.jsp";
		} else {
			Ticket savedTicket = ticketService.addTicket(ticket,result);
			
	        if (savedTicket != null) {
	            // Ticket added successfully, redirect to a page displaying the new ticket
	        	Long userId = (Long) session.getAttribute("userId");
	        	User user = userService.findById(userId);
	        	user.getTickets().add(ticket);
	        	userService.updateUser(user);
	        	
	            return "redirect:/tickets";
	        } else {
	        	model.addAttribute("bindingResult", result);
	            return "create_ticket.jsp";
	        }
		}
	}
	// show one ticket
	@GetMapping("/tickets/{id}")
	public String viewTicket(@PathVariable("id") Long id, Model model) {
		if (session.getAttribute("userId") == null)  {
			return "redirect:/logout";
		}
		Ticket ticket = ticketService.findById(id);
		model.addAttribute("ticket", ticket);
		return "view_ticket.jsp";
	}
	
	// Edit ticket
	@GetMapping("/tickets/{id}/edit")
	public String openEditTicket(@PathVariable("id") Long id, Model model) {
	    Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/logout";
		}
		Ticket ticket = ticketService.findById(id);
		  // Check if the user is the owner of the ticket
	    if (ticket.getOwner().getId().equals(userId)) {
	    	model.addAttribute("ticket", ticket);	    	
	    	return "edit_ticket.jsp";
	    }else {
	        // If the user is not the owner, redirect or show an error page
	        return "redirect:/tickets"; // You can customize this URL
	    }
	}

	@PostMapping("/tickets/edit/{id}")
	public String editTicket(@PathVariable("id") Long id, @Valid @ModelAttribute("ticket") Ticket ticket, BindingResult result,
			HttpSession session) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");

		User user = userService.findById(userId);

		if (result.hasErrors()) {
			return "edit_ticket.jsp";
		} else {
			Ticket thisTicket = ticketService.findById(id);
			ticket.setUsers(thisTicket.getUsers());
			ticket.setOwner(user);
			ticketService.updateTicket(ticket);
			return "redirect:/tickets";
		}
	}

	// Delete ticket
	@DeleteMapping("/tickets/delete/{id}")
	public String deleteTicket(@PathVariable("id") Long id) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		Ticket ticket = ticketService.findById(id);
		ticketService.deleteTicket(ticket);

		return "redirect:/tickets";
	}
}