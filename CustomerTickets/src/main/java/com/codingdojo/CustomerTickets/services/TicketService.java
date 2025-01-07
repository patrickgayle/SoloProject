package com.codingdojo.CustomerTickets.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.CustomerTickets.models.Ticket;
import com.codingdojo.CustomerTickets.repositories.TicketRepository;

@Service
public class TicketService {
	@Autowired
	private TicketRepository ticketRepo;

	public List<Ticket> allTickets() {
		return ticketRepo.findAll();
	}

	public Ticket updateTicket(Ticket ticket) {
		return ticketRepo.save(ticket);
	}

	public Ticket addTicket(Ticket ticket, BindingResult result) {
		
		Optional<Ticket> potentialTitle = ticketRepo.findByTitle(ticket.getTitle());
    	
	    // Reject if name is taken (present in database)
	    if (potentialTitle.isPresent()) {
	        result.reject("title", "The Ticket Title already exists!");
	        return null; // Or handle accordingly
	    }
		return ticketRepo.save(ticket);
	}

	public void deleteTicket(Ticket ticket) {
		ticketRepo.delete(ticket);
	}

	public Ticket findById(Long id) {
		Optional<Ticket> optionalTicket = ticketRepo.findById(id);
		if (optionalTicket.isPresent()) {
			return optionalTicket.get();
		} else {
			return null;
		}
	}
}