import { useState } from 'react';
import {
  Box,
  Button,
  Divider,
  Flex,
  Icon,
  Input,
  LabeledList,
  Section,
  Stack,
  Table,
  TextArea,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type ContractData = {
  name: string;
  owner: string;
  description: string;
  price: number;
  is_owner: boolean;
};

type ContractsManagerData = {
  contracts: ContractData[];
  user_name: string;
};

export const ContractsManager = () => {
  const { act, data } = useBackend<ContractsManagerData>();
  const { contracts, user_name } = data;
  
  const [showCreateForm, setShowCreateForm] = useState(false);
  const [contractName, setContractName] = useState('');
  const [contractDescription, setContractDescription] = useState('');
  const [contractPrice, setContractPrice] = useState('');

  const handleCreateContract = () => {
    if (!contractName || !contractDescription || !contractPrice) {
      return;
    }
    
    act('create_contract', {
      name: contractName,
      description: contractDescription,
      price: contractPrice,
    });
    
    // Очищаем форму
    setContractName('');
    setContractDescription('');
    setContractPrice('');
    setShowCreateForm(false);
  };

  const handleDeleteContract = (contractName: string) => {
    act('delete_contract', {
      name: contractName,
    });
  };

  return (
    <Window width={800} height={600}>
      <Window.Content scrollable>
        <Stack vertical>
          {/* Заголовок */}
          <Stack.Item>
            <Section
              title={
                <Box>
                  <Icon name="file-contract" /> Contracts Manager
                </Box>
              }
              buttons={
                <Button
                  icon="plus"
                  color="good"
                  onClick={() => setShowCreateForm(!showCreateForm)}
                >
                  {showCreateForm ? 'Cancel' : 'Create Contract'}
                </Button>
              }
            >
              <Box color="label">
                Welcome, <Box as="span" color="good">{user_name}</Box>! 
                Here you can create and manage contracts.
              </Box>
            </Section>
          </Stack.Item>

          {/* Форма создания контракта */}
          {showCreateForm && (
            <Stack.Item>
              <Section title="Create New Contract">
                <Stack vertical>
                  <Stack.Item>
                    <LabeledList>
                      <LabeledList.Item label="Contract Name">
                        <Input
                          value={contractName}
                          onChange={(e, value) => setContractName(value)}
                          placeholder="Enter contract name..."
                          maxLength={50}
                        />
                      </LabeledList.Item>
                      <LabeledList.Item label="Price (Credits)">
                        <Input
                          value={contractPrice}
                          onChange={(e, value) => setContractPrice(value)}
                          placeholder="Enter price..."
                        />
                      </LabeledList.Item>
                      <LabeledList.Item label="Description">
                        <TextArea
                          value={contractDescription}
                          onChange={(e, value) => setContractDescription(value)}
                          placeholder="Enter contract description..."
                          height="80px"
                          maxLength={500}
                        />
                      </LabeledList.Item>
                    </LabeledList>
                  </Stack.Item>
                  <Stack.Item>
                    <Flex>
                      <Flex.Item grow={1} />
                      <Flex.Item>
                        <Button
                          icon="check"
                          color="good"
                          onClick={handleCreateContract}
                          disabled={!contractName || !contractDescription || !contractPrice}
                        >
                          Create Contract
                        </Button>
                      </Flex.Item>
                    </Flex>
                  </Stack.Item>
                </Stack>
              </Section>
            </Stack.Item>
          )}

          {/* Список контрактов */}
          <Stack.Item grow>
            <Section title={`Available Contracts (${contracts.length})`}>
              {contracts.length === 0 ? (
                <Box color="label" textAlign="center" p={2}>
                  <Icon name="inbox" size={2} />
                  <br />
                  No contracts available. Create one to get started!
                </Box>
              ) : (
                <Table>
                  <Table.Row header>
                    <Table.Cell>Contract Name</Table.Cell>
                    <Table.Cell>Owner</Table.Cell>
                    <Table.Cell>Description</Table.Cell>
                    <Table.Cell>Price</Table.Cell>
                    <Table.Cell>Actions</Table.Cell>
                  </Table.Row>
                  {contracts.map((contract) => (
                    <Table.Row key={contract.name}>
                      <Table.Cell>
                        <Box color={contract.is_owner ? 'good' : 'label'}>
                          <Icon 
                            name={contract.is_owner ? 'star' : 'file-contract'} 
                            mr={1}
                          />
                          {contract.name}
                        </Box>
                      </Table.Cell>
                      <Table.Cell>{contract.owner}</Table.Cell>
                      <Table.Cell>
                        <Box 
                          style={{
                            maxWidth: '200px',
                            overflow: 'hidden',
                            textOverflow: 'ellipsis',
                            whiteSpace: 'nowrap'
                          }}
                          title={contract.description}
                        >
                          {contract.description}
                        </Box>
                      </Table.Cell>
                      <Table.Cell>
                        <Box color="good">
                          <Icon name="coins" mr={1} />
                          {contract.price} credits
                        </Box>
                      </Table.Cell>
                      <Table.Cell>
                        {contract.is_owner ? (
                          <Button
                            icon="trash"
                            color="bad"
                            onClick={() => handleDeleteContract(contract.name)}
                          >
                            Delete
                          </Button>
                        ) : (
                          <Button
                            icon="handshake"
                            color="good"
                            disabled
                          >
                            Accept
                          </Button>
                        )}
                      </Table.Cell>
                    </Table.Row>
                  ))}
                </Table>
              )}
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};