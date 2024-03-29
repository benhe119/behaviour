#
# GRAKN.AI - THE KNOWLEDGE GRAPH
# Copyright (C) 2019 Grakn Labs Ltd
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

Feature: Connection Keyspace

  Background:
    Given connection has been opened
    Given connection delete all keyspaces
    Given connection does not have any keyspace

  Scenario: create one keyspace
    When  connection create keyspace:
      | alice   |
    Then  connection has keyspace:
      | alice   |

  Scenario: create many keyspaces
    When  connection create keyspaces:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |
    Then  connection has keyspaces:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |

  @ignore
  Scenario: create many keyspaces in parallel
    When  connection create keyspaces in parallel:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |
    Then  connection has keyspaces:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |

  Scenario: delete one keyspace
      # This step should be rewritten once we can create keypsaces without opening sessions
    Given connection create keyspace:
      | alice   |
    When  connection delete keyspace:
      | alice   |
    Then  connection does not have keyspace:
      | alice   |
    Then  connection does not have any keyspace

  Scenario: connection can delete many keyspaces
      # This step should be rewritten once we can create keypsaces without opening sessions
    Given connection create keyspaces:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |
    When  connection delete keyspaces:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |
    Then  connection does not have keyspaces:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |
    Then  connection does not have any keyspace

  Scenario: delete many keyspaces in parallel
      # This step should be rewritten once we can create keypsaces without opening sessions
    Given connection create keyspaces in parallel:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |
    When  connection delete keyspaces in parallel:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |
    Then  connection does not have keyspaces:
      | alice   |
      | bob     |
      | charlie |
      | dylan   |
      | eve     |
      | frank   |
      | george  |
      | heidi   |
      | ivan    |
      | judy    |
      | mike    |
      | neil    |
    Then  connection does not have any keyspace