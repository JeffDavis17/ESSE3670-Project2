%% This is a Function that gathers all the observations from a given satellite reading
% works by entering a block (b) of the satellite information for a given
% set of observations and returns those necessary for ECEF computation


function [observations] = obs(b)
observations = [b(42),b(22),b(17),b(13),b(31),b(41),b(34),b(32),b(12),b(21),b(24),b(43),b(23),b(14),b(15),b(33),b(44)];
end
