package com.codingdojo.CustomerTickets.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.CustomerTickets.models.Ticket;
import com.codingdojo.CustomerTickets.models.User;

@Repository
public interface TicketRepository extends CrudRepository<Ticket, Long> {
	List<Ticket> findAll();
	Ticket findByIdIs(Long id);
	List<Ticket> findAllByUsers(User user);
	Optional<Ticket> findByTitle(String title);
}